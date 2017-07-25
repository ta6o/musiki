module Musiki

  OCTAVE = [
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

  MAKAM = {
    "cargah" => {:name => "çârgâh", :code => "c5c4"},
    "buselik" => {:name => "bûselik", :code => "b5k4"},
    "sehnazbuselik" => {:name => "şehnâz bûselik", :code => "b5h4"},
    "kurdi" => {:name => "kürdî", :code => "k4b5"},
    "rast" => {:name => "râst", :code => "r5r4"},
    "ussak" => {:name => "uşşak", :code => "u4b5"},
    "beyati" => {:name => "beyâtî", :code => "u4b5"},
    "ısfahan" => {:name => "isfahan", :code => "u4b5"},
    "humayun" => {:name => "hümâyûn", :code => "h4b5"},
    "hicaz" => {:name => "hicaz", :code => "h4r5"},
    "uzzal" => {:name => "uzzâl", :code => "h5u4"},
    "zirgulelihicaz" => {:name => "zîrgûle'li hicaz", :code => "h5h4"},
    "huseyni" => {:name => "hüseynî", :code => "u5u4"},
    #"muhayyer" => {:name => "muhayyer", :code => "u5u4"},
    #"gulizar" => {:name => "gülizâr", :code => "u5u4"},
    "neva" => {:name => "nevâ", :code => "u4r5"},
    #"tahir" => {:name => "tâhir", :code => "u4r5"},
    "karcigar" => {:name => "karcığar", :code => "u4h5"},
    "suznak" => {:name => "sûz'nâk", :code => "r5h4"},
    "neveser" => {:name => "nev'eser", :code => "n5h4"},
  }

  MAKAM_ALIAS = {
    "buselik2" => "sehnazbuselik",
    "2buselik" => "sehnazbuselik",
    "ikincibuselik" => "sehnazbuselik",
  }

  NAMED_TRANSPOSITION = {
    "mahur" => {:name => "mâhûr", :makam => "cargah", :tonic => "râst"},
    "acemasiran" => {:name => "acem aşîrân", :makam => "cargah", :tonic => "acem aşîrân"},
    "nihavend" => {:name => "nihâvend", :makam => "buselik", :tonic => "râst"},
    "ruhnuvaz" => {:name => "ruhnüvâz", :makam => "buselik", :tonic => "hüseynî aşîrân"},
    "sultaniyegah" => {:name => "sultânî yegâh", :makam => "buselik", :tonic => "yegâh"},
    "kurdilihicazkar" => {:name => "kürdî'li hicazkâr", :makam => "kurdi", :tonic => "râst"},
    "askefza" => {:name => "aşkefzâ", :makam => "kurdi", :tonic => "hüseynî aşîrân"},
    "zirgulelisuznak" => {:name => "zîrgûle'li sûz'nâk", :makam => "zirgulelihicaz", :tonic => "râst"},
    "hicazkar" => {:name => "hicazkâr", :makam => "zirgulelihicaz", :tonic => "râst"},
    "evcara" => {:name => "evcârâ", :makam => "zirgulelihicaz", :tonic => "ırâk"},
    "suzidil" => {:name => "sûz-i dil", :makam => "zirgulelihicaz", :tonic => "hüseynî aşîrân"},
    "seddiaraban" => {:name => "şedd-i arabân", :makam => "zirgulelihicaz", :tonic => "yegâh"},
    "rengidil" => {:name => "reng-i dil", :makam => "neveser", :tonic => "acem aşîrân"},
    "heftgah" => {:name => "heft-gâh", :makam => "segah", :tonic => "nîm hicaz"},
  }

  INTERVAL = {
    F: {value: 1, sharp: "", flat: "", name: "koma"},
    E: {value: 3, sharp: "", flat: "", name: "eksik bakıye"},
    B: {value: 4, sharp: "", flat: "", name: "bakıye"},
    S: {value: 5, sharp: "", flat: "", name: "küçük mücenneb"},
    K: {value: 8, sharp: "", flat: "", name: "büyük mücenneb"},
    T: {value: 9, sharp: "", flat: "", name: "tanini"},
    A: {value: 12, sharp: "", flat: "", name: "artık ikili"},
    Z: {value: 13, sharp: "", flat: "", name: "artık ikili"}
  }

  TRIAD = {
    c: {name: "çârgâh", interval: "TT", tonic:0},
    b: {name: "bûselik", interval: "TB", tonic:18},
    k: {name: "kürdî", interval: "BT", tonic:18},
    r: {name: "râst", interval: "TK", tonic:14},
    u: {name: "uşşak", interval: "KS", tonic:18},
    h: {name: "hicaz", interval: "SA", tonic:18},
    n: {name: "nikrîz", interval: "TS", tonic:14}
  }

  TETRAD = {}
  TRIAD.each do |n, h|
    x = 22 - h[:interval].split("").map{|i| INTERVAL[i.to_sym][:value] }.inject(&:+)
    TETRAD[n] = h.dup
    TETRAD[n][:interval] = h[:interval]+(INTERVAL.map{|k,v| v[:value] == x ? k : nil }-[nil])[0].to_s
  end

  PENTAD = {}
  TETRAD.each do |n, h|
    PENTAD[n] = h.dup
    PENTAD[n][:name] = "hüseynî" if PENTAD[n][:interval] == "KST"
    PENTAD[n][:interval] = h[:interval]+"T"
  end

  MODE = {3 => TRIAD, 4 => TETRAD, 5 => PENTAD}

  @@base = 64
  COMMA = 2 ** (1/53.0)
  MODETONE = 2 ** (1/12.0)

  require "csv"

  NOTES = []
  CSV.open("../misc/makam.csv","w") do |csv|
    csv << ["kaba","tîz",2,3,"kesir","oran", "aralık", "koma", "koma oran","fark","tempere","fark"]
    koma = -1
    OCTAVE.each_with_index do |ton,ind|
      koma += ton[-1]
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

      NOTES[ind] = {
        :name => ton[0],
        :interval => ton[-1],
        :interval_symbol => (INTERVAL.map{|i,j| ton[-1] == j[:value] ? i : nil }-[nil])[0].to_s,
        :fraction => m1,
        :frequency => eval("#{line[-1].strip}.0"),
        :power2 => ton[2],
        :power3 => ton[3],
        :comma => koma,
        :order => ind
      }

      if ind > 0
        NOTES[ind+24] = {
          :name => ton[1],
          :interval => ton[-1],
          :interval_symbol => (INTERVAL.map{|i,j| ton[-1] == j[:value] ? i : nil }-[nil])[0].to_s,
          :fraction => m1,
          :frequency => eval("#{line[-1].strip}.0*2"),
          :power2 => ton[2]+1,
          :power3 => ton[3],
          :comma => koma + 53,
          :order => ind+24
        }
      end

      line << eval("#{line[-1].strip}.0")
      line << ton[-1]
      line << koma
      line << COMMA ** koma
      line << line[8] / line[5] - 1
      if [0,2,4,5,8,9,12,14,15,18,19,22,24].include?(ind)
        line << MODETONE ** {0=>0,2=>1,4=>2,5=>3,8=>4,9=>5,12=>6,14=>7,15=>8,18=>9,19=>10,22=>11,24=>12}[ind]
        line << line[10] / line[5] - 1
      else
        line << ""
        line << ""
      end
      csv << line
    end
  end

  def self.base
    @@base
  end

  def self.set_base base, update=false
    @@base = base
    Musiki.update if update
  end

  def self.update
    GC.start
    ObjectSpace.each_object(Musiki::Note) do |n|
      n.update
    end
  end

  @@verbose = false;

  def self.verbose?
    @@verbose
  end

  def self.verbose!
    @@verbose = (not @@verbose)
  end

  class Makam

    attr_reader :intervals, :interval_symbols, :name, :notes, :note_names, :tonic, :dominant, :subdominant

    def initialize m, up = true, down = true
      GC.start
      m = m.name if m.is_a?(Note)
      m = NOTES[m][:name] if m.is_a?(Integer)
      if MAKAM.has_key?(m.tr_to_ascii.downcase.gsub(/\W/,""))
        g = MAKAM[m.tr_to_ascii.downcase.gsub(/\W/,"")]
      elsif MAKAM_ALIAS.has_key?(m.tr_to_ascii.downcase.gsub(/\W/,""))
        g = MAKAM[MAKAM_ALIAS[m.tr_to_ascii.downcase.gsub(/\W/,"")]]
      elsif g = (MAKAM.map{|i,j| j[:code] == m ? j : nil}-[nil])[0]
      elsif m.scan(/\w\d/).length > 1
        g = {:name=>"Sallama",:code=>m}
      end
      return unless g
      if up and down
        self.setup(g)
        @up = self
        @down = Makam.new(m, false, true)
      elsif up
        self.setup(g)
        @up = self
        @down = nil
      elsif down
        self.setdown(g)
        @up = nil
        @down = self
      end
    end

    def inspect
      @name ? "#{@name} makamı".tr_capitalize : nil
    end
    def []key
      @notes[key]
    end
    def up
      @up
    end

    def down
      @down
    end

    def sample dur=500
      # TODO seems there's an error with the frequencies, doesn't sound right.
      puts "#{self.inspect}:" if self.up or self.down
      if self.up
        print "> "
        self.up.notes.each_with_index do |note,index|
          print "#{index == 0 ? note.name.tr_capitalize : note.name}#{index < self.notes.length - 1 ? ", " : "."}"
          `chuck --bufsize64 ../misc/makam.ck:#{Musiki::base}:#{dur}:#{note.order} 2>&1 >/dev/null`
        end
        puts
      end
      if self.down
        print "< "
        self.down.notes.each_with_index do |note,index|
          print "#{index == 0 ? note.name.tr_capitalize : note.name}#{index < self.down.notes.length - 1 ? ", " : "."}"
          `chuck --bufsize64 ../misc/makam.ck:#{Musiki::base}:#{dur}:#{note.order} 2>&1 >/dev/null`
        end
        puts
      end
    end

    def setup g
      @name = g[:name]
      m = g[:code].scan(/\w\d/)
      n = m.index{|i| i=~/[A-Z]\w/} || 0
      n = 0
      m.map!(&:downcase)
      q = m.map {|i| MODE[i[1].to_i][i[0].to_sym] }
      @interval_symbols = q.map {|i| i[:interval].split("") }.flatten
      @intervals = @interval_symbols.map{|i| INTERVAL[i.to_sym][:value]}
      @tonic = q[n][:tonic]
      a = NOTES.map{|i|i[:interval]}
      u = a[@tonic..-1]
      dd = @tonic
      @notes = [dd]
      p [0, u[0], NOTES[dd][:name], NOTES[dd][:comma], dd] if Musiki.verbose?
      puts if Musiki.verbose?
      @intervals.each do |int|
        while true
          puts "\e[39m#{[int, u[0], NOTES[dd][:name], NOTES[dd][:comma], dd]}" if Musiki.verbose?
          int -= u.shift
          dd += 1
          if int == 0
            puts "\e[32m#{[int, u[0], NOTES[dd][:name], NOTES[dd][:comma], dd]}" if Musiki.verbose?
            puts if Musiki.verbose?
            break
          elsif int < 0
            dd -= 1
            puts "\e[31m#{[int, u[0], "< #{NOTES[dd][:name]}", NOTES[dd][:comma], dd]}" if Musiki.verbose?
            puts if Musiki.verbose?
            break
          end
        end
        @notes << dd
      end
      @notes.map!{|i| Note.new(i, @notes[0])}
      @note_names = @notes.map {|i| i.name.tr_capitalize}
    end

    def setdown g
      @name = "inici #{g[:name]}"
      m = g[:code].scan(/\w\d/)
      n = m.index{|i| i=~/[A-Z]\w/} || 0
      n = 0
      m.map!(&:downcase)
      q = m.map {|i| MODE[i[1].to_i][i[0].to_sym] }
      @interval_symbols = q.map {|i| i[:interval].split("") }.flatten.reverse
      @intervals = @interval_symbols.map{|i| INTERVAL[i.to_sym][:value] * -1}
      @tonic = q[n][:tonic]+24
      a = NOTES.map{|i|i[:interval]}
      u = a[0..@tonic].reverse.map{|i| i * -1}
      dd = @tonic
      @notes = [dd]
      #p [0, u[0], NOTES[dd][:name]]
      #puts
      @intervals.each do |int|
        while true
          int -= u.shift
          dd -= 1
          #p [int, u[0], NOTES[dd][:name]]
          if int == 0
            break
          elsif int > 0
            dd += 1
            break
          end
        end
        #puts
        @notes << dd
      end
      @notes.map!{|i| Note.new(i)}
      @note_names = @notes.map {|i| i.name.tr_capitalize}
    end

  end

  class Note

    attr_reader :name, :fraction, :absolute_frequency, :frequency, :power2, :power3, :order, :interval_before, :interval_before_symbol, :interval_after, :interval_after_symbol,
                :comma, :relative_fraction, :relative_frequency, :relative_power2, :relative_power3, :relative_order, :role

    def initialize a=0, b=0
      m = find_note a
      n = find_note b
      self.setup m, n
    end

    def inspect
      "#{@name}".tr_capitalize
    end

    def fraction_to n
      if n.class == Musiki::Note
        2 ** (self.power2 - n.power2) * 3 ** (self.power3 - n.power3)
      elsif n.class == Hash
        2 ** (self.power2 - n[:power2]) * 3 ** (self.power3 - n[:power3])
      else
        begin
          n = find_note n
          2 ** (self.power2 - n[:power2]) * 3 ** (self.power3 - n[:power3])
        rescue
          nil
        end
      end
    end

    def fraction_from n
      self.fraction_to(n) ** -1
    end

    def transpose o
      if o.is_a? Integer
        self.setup(find_note(self.order + o), find_note((self.relative_order - self.order)*-1 + o))
      elsif o.match(/^[+-]?\d+c$/)
        o = o.match(/\d+/)[0].to_i * (o.match(/^-/) ? -1 : 1)
      elsif o.match(/^[+-]?[FEBSKTAZ]$/i)
        o = INTERVAL[o.match(/\w/)[0].upcase.to_sym][:value] * (o.match(/^-/) ? -1 : 1)
      end
    end

    def setup m, n
      @name = m[:name]
      @frequency = m[:frequency]
      @absolute_frequency = Musiki.base * m[:frequency]
      @fraction = m[:fraction].gsub(/\s/,"").to_r
      @order = m[:order]
      @power2 = m[:power2]
      @power3 = m[:power3]
      @interval_before = m[:interval]
      @interval_before_symbol = m[:interval_symbol]
      @interval_after = NOTES[(m[:order]+1)%48][:interval]
      @interval_after_symbol = NOTES[(m[:order]+1)%48][:interval_symbol]
      
      # values relative to the makam
      @relative_fraction = self.fraction_to n
      @relative_frequency = eval("#{self.relative_fraction}.0")
      @relative_order = self.order - n[:order]
      rf = self.relative_fraction.to_r.to_s.split("/").map(&:to_i)
      if rf[0] % 2 == 0
        @relative_power2 = Math.log(rf[0],2).to_i
        @relative_power3 = Math.log(rf[1],3).to_i * -1
      else
        @relative_power2 = Math.log(rf[1],2).to_i * -1
        @relative_power3 = Math.log(rf[0],3).to_i
      end
      @comma = m[:comma] - n[:comma]
      self
    end

    def find_note n
      if n.to_s.to_i == n
        NOTES[n % 48]
      elsif n.class == Musiki::Note
        NOTES[n.order]
      elsif n = NOTES.map{|t| t[:name].tr_to_ascii}.index(n.tr_to_ascii)
        NOTES[i]
      end
    end

    def update
      @absolute_frequency = Musiki.base * self.relative_frequency
    end

    def freq
      @absolute_frequency
    end
    def freq
      @absolute_frequency
    end
    def ratio
      @relative_frequency
    end
    def rel_freq
      @relative_frequency
    end
    def int
      @interval_before
    end
    def interval
      @interval_before
    end
    def int_sym
      @interval_before_symbol
    end
    def interval_symbol
      @interval_before_symbol
    end
  end

end

class String
  def tr_to_ascii
    self.gsub("Â","A").gsub(/[Îİ]/,"I").gsub(/[ÔÖ]/,"O").gsub(/[ÛÜ]/,"U")
        .gsub("â","a").gsub(/[îı]/,"i").gsub(/[ôö]/,"o").gsub(/[ûü]/,"u")
        .gsub("Ç","C").gsub("G","G").gsub("Ş","S")
        .gsub("ç","c").gsub("ğ","g").gsub("ş","s")
  end
  def tr_upcase
    self.gsub("â","Â").gsub("ı","I").gsub("i","İ").gsub("ö","Ö").gsub("U","Ü").gsub("î","Î").gsub("û","Û").gsub("ç","Ç").gsub("ğ","G").gsub("ş","Ş").upcase
  end
  def tr_downcase
    self.gsub("Â","â").gsub("I","ı").gsub("İ","i").gsub("Ö","ö").gsub("Ü","U").gsub("Î","î").gsub("Û","û").gsub("Ç","ç").gsub("G","ğ").gsub("Ş","ş").downcase
  end
  def tr_capitalize
    self.gsub(/^â/,"Â").gsub(/^ı/,"I").gsub(/^i/,"İ").gsub(/^ö/,"Ö").gsub(/^U/,"Ü").gsub(/^î/,"Î").gsub(/^û/,"Û").gsub(/^ç/,"Ç").gsub(/^ğ/,"G").gsub(/^ş/,"Ş").capitalize
  end
end
