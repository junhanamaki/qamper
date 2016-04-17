require "thor"

module SneakersEx
  module CliLib
    module Commands
      class Start < Thor::Group

        desc "Starts Qamper"

        def perform
          Sneakers::Runner.new(amqp_endpoints).run
        end

      end
    end
  end
end
