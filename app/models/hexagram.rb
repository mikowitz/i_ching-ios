class Hexagram
  ATTRS = %w{ king_wen_number english_name chinese_name characters judgement image binary }

  attr_accessor *ATTRS

  def self.find(king_wen_number)
    Turnkey.unarchive("hexagram-#{king_wen_number}")
  end

  def self.from_json(json)
    hexagram = new
    ATTRS.each do |method_name|
      hexagram.send(:"#{method_name}=", json[method_name])
    end
    Turnkey.archive(hexagram, "hexagram-#{hexagram.king_wen_number}")
  end
end
