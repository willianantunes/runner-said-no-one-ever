module Support
  module LogHelper
    module Initializer
      # Initialize instance level logger at the time of instance creation
      def initialize(*params)
        super
        logger
      end
    end

    @loggers = {}

    class << self
      def included(the_guy_who_included_the_module)
        # https://stackoverflow.com/a/15384720/3899136
        the_guy_who_included_the_module.__send__(:prepend, Initializer)

        # Class level private logger method for the_guy_who_included_the_module
        class << the_guy_who_included_the_module
          private

          def logger
            @logger ||= LogHelper.logger_for(self)
          end
        end

        # Initialize class level logger at the time of including
        the_guy_who_included_the_module.__send__(:logger)
      end

      # Global, memoized, lazy initialized instance of a logger
      def logger_for(classname)
        @loggers[classname] ||= configure_logger_for(classname)
      end

      def configure_logger_for(classname)
        logger = Logger.new($stdout)
        # TODO: configure level through ENV
        logger.level = Config::Settings::PROJECT_LOG_LEVEL
        logger.progname = classname

        if Config::Settings::RACK_ENV == :production
          logger.formatter =
            proc do |severity, datetime, prog_name, msg|
              record = {
                level: severity,
                prog_name: prog_name,
                pid: Process.pid,
                thread_id: Thread.current.object_id,
                registered_at: datetime.iso8601(3),
                message: msg
              }
              "#{record.to_json}\n"
            end
        end

        logger
      end
    end

    private

    def logger
      @logger ||= LogHelper.logger_for(self.class.name)
    end
  end
end
