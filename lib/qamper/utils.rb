module Qamper
  module Utils

    def self.camelize(text)
      text.split("_").map(&:capitalize).join
    end

    def self.underscore(text)
      text.gsub(/(.)([A-Z])/,'\1_\2').downcase
    end

  end
end