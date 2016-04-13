require "thor"

require_relative "../../utils"
require_relative "../../version"

module Qamper
  module CliLib
    module Commands
      class New < Thor::Group

        include Thor::Actions

        desc "Initializes project"
        argument :name, type: :string, desc: "The name of the project"

        def self.source_root
          File.expand_path("../templates", __dir__)
        end

        no_commands do
          def underscored_name; Utils.underscore(name); end

          def camelized_name; Utils.camelize(name); end

          def gem_version; "~> #{Qamper::VERSION[/^\d\.\d/]}"; end
        end

        def perform
          directory("project", "#{underscored_name}")
        end

      end
    end
  end
end