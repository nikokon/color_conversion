module ColorConversion
  class HexConverter < ColorConverter

    def self.matches?(color)
      return false unless color.kind_of?(String)
      color.include?("#") && [4, 5, 7, 9].include?(color.length)
    end

    private

    def to_rgba(hex)
      hex = normalize_hex(hex)

      {:r => hex[0,2].hex,
       :g => hex[2,2].hex,
       :b => hex[4,2].hex,
       :a => hex[6,2].hex / 255.0}
    end

    def normalize_hex(hex)
      hex = hex.gsub("#", "")
      case hex.length
      when 3
        hex.split("").map { |character| character.to_s * 2 }.join + "ff"
      when 4
        hex.split("").map { |character| character.to_s * 2 }.join
      when 6
        (hex + "ff")
      when 8
        hex
      end.downcase
    end
  end
end
