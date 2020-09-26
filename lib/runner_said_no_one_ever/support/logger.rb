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
        the_guy_who_included_the_module.send(:prepend, Initializer)

        # Class level private logger method for includer class (the_guy_who_included_the_module)
        class << the_guy_who_included_the_module
          private

          def logger
            @logger ||= LogHelper.logger_for(self)
          end
        end

        # Initialize class level logger at the time of including
        the_guy_who_included_the_module.send(:logger)
      end

      # Global, memoized, lazy initialized instance of a logger
      def logger_for(classname)
        @loggers[classname] ||= configure_logger_for(classname)
      end

      def configure_logger_for(classname)
        return Ougai::Logger.new($stdout) if Config::Settings::RACK_ENV == :production

        logger = Logger.new($stdout)
        # TODO: configure level through ENV
        logger.level = Logger::INFO
        logger.progname = classname
        logger
      end
    end

    private

    def logger
      @logger ||= LogHelper.logger_for(self.class.name)
    end
  end
end
