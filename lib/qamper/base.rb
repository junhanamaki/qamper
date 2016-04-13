module Qamper
  class Base

    def self.inherited(klass)
      klass.extend(DslModule)
    end

    module DslModule

      def options(queue_name, options = {})
        @schematic = WorkerSchematic.new(queue_name, options)

        WorkerSchematicRegistry.add(@schematic)
      end

      def key(routing_key, &handler)
        raise "options must be set before invoking key" unless @schematic

        @schematic.add_handler(routing_key, handler)
      rescue => e
        raise "in #{self.class}: #{e.message}"
      end

    end

  end
end