require "thor"

module Qamper
  module CliLib
    module Commands
      class Start < Thor::Group

        desc "Starts Qamper"
        argument :name, type: :string, desc: "The name of the project"

        def perform
        end

      end
    end
  end
end