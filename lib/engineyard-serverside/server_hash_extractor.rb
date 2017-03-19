module EY
  module Serverside
    class ServerHashExtractor
      def self.hashes(options, config)
        new(options, config).hashes
      end

      attr_reader :options, :config

      def initialize(options, config)
        @options = options
        @config = config
      end

      def hashes
        return [] unless instances

        instances.collect {|hostname|
          {
            :hostname => hostname,
            :roles => instance_roles[hostname].to_s.split(','),
            :name => instance_names[hostname],
            :user => config.user
          }
        }
      end

      private
      def instances
        options[:instances]
      end

      def instance_roles
        options[:instance_roles]
      end

      def instance_names
        options[:instance_names]
      end

    end
  end
end
