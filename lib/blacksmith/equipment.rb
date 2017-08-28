module BlackSmith
  class Equipment
    ROOT = File.expand_path("../../../assets", __FILE__)

    def self.get(filename = nil)
      raise NoEquipmentError, "No filename specified" if filename.nil?

      %w(jpg png).each do |ext|
        path = "#{ROOT}/#{filename}.#{ext}"
        return File.new(path) if File.exist?(path)
      end

      raise EquipmentNotFound, "No such file: #{filename}"
    end
  end

  class NoEquipmentError < StandardError ; end
  class EquipmentNotFound < StandardError ; end
end
