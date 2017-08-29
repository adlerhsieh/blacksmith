module Blacksmith
  class Resource
    ROOT = File.expand_path("../../../assets", __FILE__)
    EXTENTIONS = %w(jpg png)

    def self.get(filename = nil)
      raise NoResourceError, "No filename specified" if filename.nil?

      EXTENTIONS.each do |ext|
        path = "#{ROOT}/#{filename}.#{ext}"
        return File.new(path) if File.exist?(path)
      end

      raise ResourceNotFound, "No such file: #{ROOT}/#{filename} (#{EXTENTIONS.join(", ")}). Possible resources: #{possible_resources}"
    end

    def self.possible_resources
      Dir["#{ROOT}/assets/**/*"].map do |file|
        file.split("/").last.split(".")[0..-2]
      end
    end
  end

  class NoResourceError < StandardError ; end
  class ResourceNotFound < StandardError ; end
end
