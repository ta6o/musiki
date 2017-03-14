$sekizli = [
  ["kaba çârgâh","çârgâh",0,0,1] ,
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

$makam = {
  "cargah" => "c5c4"
}

$ara = {
  F: {v: 1, d: "", b: ""},
  E: {v: 3, d: "", b: ""},
  B: {v: 4, d: "", b: ""},
  S: {v: 5, d: "", b: ""},
  K: {v: 8, d: "", b: ""},
  T: {v: 9, d: "", b: ""},
  A: {v: 12, d: "", b: ""},
  Z: {v: 13, d: "", b: ""}
}

$c3 = {
  c: {n: "çârgâh", a: "TT", d:0},
  b: {n: "bûselik", a: "TB", d:18},
  k: {n: "kürdî", a: "BT", d:18},
  r: {n: "râst", a: "TK", d:14},
  u: {n: "uşşak", a: "KS", d:18},
  h: {n: "hicaz", a: "SA", d:18},
  n: {n: "nikrîz", a: "TS", d:14}
}

$c4 = {}
$c3.each do |n, h|
  x = 22 - h[:a].split("").map{|i| $ara[i.to_sym][:v] }.inject(&:+)
  h[:a] = h[:a]+($ara.map{|k,v| v[:v] == x ? k : nil }-[nil])[0].to_s
  $c4[n] = h
end

$c5 = {}
$c4.each do |n, h|
  $c5[n] = h.dup
  $c5[n][:a] = h[:a]+"T"
end

$c = {3 => $c3, 4 => $c4, 5 => $c5}

$koma = 2 ** (1/53.0)
$temp = 2 ** (1/12.0)

require "csv"

$dizi = []
CSV.open("./makam.csv","w") do |csv|
  csv << ["kaba","tîz",2,3,"kesir","oran", "aralık", "koma", "koma oran","fark","tempere","fark"]
  koma = 0
  $sekizli.each_with_index do |ton,ind|
    line = ton[0..-2]
    if ton[2] > 0
      m1 = "#{2 ** ton[2]} / #{3 ** (ton[3]*-1)}"
      m2 = "#{2 ** ton[2]*2} / #{3 ** (ton[3]*-1)}"
      line << m1
    else
      m1 = "#{3 ** ton[3]} / #{2 ** (ton[2]*-1)}"
      m2 = "#{3 ** ton[3]} / #{2 ** (ton[2]*-1-1)}"
      line << m1
    end

    $dizi[ind] = {
      :name => ton[0],
      :int => ton[-1],
      :int_sym => ($ara.map{|i,j| ton[-1] == j[:v] ? i : nil }-[nil])[0].to_s,
      :frac => m1,
      :freq => eval("#{line[-1].strip}.0")
    }

    if ind > 0
      $dizi[ind+24] = {
        :name => ton[1],
        :int => ton[-1],
        :int_sym => ($ara.map{|i,j| ton[-1] == j[:v] ? i : nil }-[nil])[0].to_s,
        :frac => m1,
        :freq => eval("#{line[-1].strip}.0*2")
      }
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

require "unidecoder"

class Makam
  def initialize m
    if $makam.has_key?(m.to_ascii.downcase)
      m = $makam[m.to_ascii.downcase].scan(/\w\d/)
    else
      m = m.scan(/\w\d/)
    end
    n = m.index{|i| i=~/[A-Z]\w/} || 0
    n = 0
    m.map!(&:downcase)
    q = m.map {|i| $c[i[1].to_i][i[0].to_sym] }
    r = q.map {|i| i[:a].split("") }.flatten
    {:a=>r,:d=>q[n][:d]}
    @@int_sym = r
    @@int = @@int_sym.map{|i| $ara[i.to_sym][:v]}
    @@tonic = q[n][:d]
    a = $dizi.map{|i|i[:int]}
    u = a[@@tonic..-1]
    dd = @@tonic
    @@notes = [dd]
    #p [0, u[0], $dizi[dd][:name]]
    #puts
    @@int.each do |int|
      while true
        int -= u.shift
        dd += 1
        #p [int, u[0], $dizi[dd][:name]]
        if int == 0
          break
        elsif int < 0
          dd -= 1
          break
        end
      end
      #puts
      @@notes << dd
    end
    @@note_names = @@notes.map {|i| $dizi[i][:name]}
  end

  def int
    @@int
  end

  def int_sym
    @@int_sym
  end

  def notes
    @@notes
  end

  def note_names
    @@note_names
  end

  def tonic
    @@tonic
  end
end

