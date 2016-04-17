require "sneakers"

module Qamper
  class Configuration < OpenStruct

    def initialize(*args)
      super(*args)
    end

    class << self

      def configure
        yield configuration

        # config sneakers
        Sneakers.configure(configuration.marshal_dump)

        # config log
        Sneakers.logger.level = configuration.logger_level || Logger::INFO
      end

      def configuration
        @configuration ||= new(defaults)
      end

      def reset
        @configuration = new(defaults)
      end

      def defaults
        {
          # endpoint config
          amqp: ,
          vhost: ,
          exchange: "sneakers",      # AMQP exchange

          heartbeat: 1000,

          exchange_type: :topic,
          workers: ,
          handler: ,

          # A configuration file (see below)
          runner_config_file: nil,
          metrics: nil,             # A metrics provider implementation
          daemonize: true,          # Send to background
          start_worker_delay: 0.2,  # When workers do frenzy-die, randomize to avoid resource starvation
          workers: 4,               # Number of per-cpu processes to run
          log: "sneakers.log",      # Log file
          pid_path: "sneakers.pid", # Pid file

          # Global Worker configuration
          timeout_job_after: 5,      # Maximal seconds to wait for job
          prefetch:          10,     # Grab 10 jobs together. Better speed.
          threads: 10,               # Threadpool size (good to match prefetch)

          # Environment
          env: ENV["RACK_ENV"],

          # Type of queue
          durable: true,
          ack: true,                 # Must we acknowledge?
        }
      end

    end

  end
end