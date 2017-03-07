$makam = [
  ["kaba çârgâh","çârgâh",0,0,0] ,
  ["kaba nîm hicâz","nîm hicâz", 8, -5, 4],
  ["kaba hicâz","hicâz", -11, 7, 1],
  ["kaba dik hicâz","dik hicâz", 16, -10, 3],
  ["yegâh","nevâ", -3, 2, 1],
  ["kaba nîm hisar","nîm hisâr", 5, -3, 4],
  ["kaba hisar","hisâr", -14, 9, 1],
  ["kaba dik hisar","dik hisâr", 13, -8, 3],
  ["hüseynî aşîrân","hüseynî", -6, 4, 1],
  ["acem aşîrân","acem", 2, -1, 4],
  ["dik acem aşîrân ","dik acem", -17, 11, 1],
  ["ırak","eviç", 10, -6, 3],
  ["geveşt","mâhûr", -9, 6, 1],
  ["dik geveşt","dik mâhûr", 18, -11, 3],
  ["râst","gerdâniye", -1, 1, 1],
  ["nîm zîrgûle","nîm şehnâz", 7, -4, 4],
  ["zîrgûle","şehnâz", -12, 8, 1],
  ["dik zîrgûle","dik şehnâz", 15, -9, 3],
  ["dügâh","muhayyer", -4, 3, 1],
  ["kürdî","sünbüle", 4, -2, 4],
  ["dik kürdî","dik sünbüle", -15, 10, 1],
  ["segâh","tîz segâh", 12, -7, 3],
  ["bûselik","tîz bûselik", -7, 5, 1],
  ["dik bûselik","tîz dik bûselik", 20, -12, 3],
  ["çârgâh","tîz çârgâh", 1, 0, 1]
]

$koma = 2 ** (1/53.0)
$temp = 2 ** (1/12.0)

require "csv"

CSV.open("./makam.csv","w") do |csv|
  csv << ["kaba","tîz",2,3,"kesir","oran", "aralık", "koma", "koma oran","fark","tempere","fark"]
  koma = 0
  $makam.each_with_index do |ton,ind|
    line = ton[0..-2]
    if ton[2] > 0
      line << "#{2 ** ton[2]} / #{3 ** (ton[3]*-1)}"
    else
      line << "#{3 ** ton[3]} / #{2 ** (ton[2]*-1)}"
    end
    line << eval("#{line[-1].strip}.0")
    line << ton[-1]
    line << koma += ton[-1]
    line << $koma ** koma
    line << line[8] / line[5] - 1
    if [0,2,4,5,8,9,12,14,15,18,19,22,24].include?(ind)
      line << $temp ** {0=>0,2=>1,4=>2,5=>3,8=>4,9=>5,12=>6,14=>7,15=>8,18=>9,19=>10,22=>11,24=>12}[ind]
      line << line[10] / line[5] - 1
    else
      line << ""
      line << ""
    end
    csv << line
  end
end
