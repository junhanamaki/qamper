require "thor"

require_relative "cli_lib/commands/new"
require_relative "cli_lib/commands/start"

module Qamper
  class Cli < Thor

    long_desc <<-LONGDESC
      Initializes a new Qamper project by creating a basic directory
    LONGDESC
    method_option aliases: "n"
    register(CliLib::Commands::New, "new", "new", "Initializes project")

    desc "start", "Start Qamper"
    method_option aliases: "s"
    register(CliLib::Commands::Start, "start", "start", "Starts Qamper")

  end
end
