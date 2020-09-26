module Support
  module Utils
    class << self
      def included(the_guy_who_included_the_module)
        the_guy_who_included_the_module.extend(ClassMethods)
      end
    end

    module ClassMethods
      def get_env_or_raise_exception(name)
        ENV[name] || raise(EnvironmentError, "Environment variable #{name} is not set!")
      end

      def logging_severity(value)
        valid_values = Logger::Severity.constants
        valid = valid_values.any?(value)

        raise(LoggingSeverityError, "#{value} is not valid! Valid values: #{valid_values}") unless valid

        Logger.const_get(value)
      end
    end

    class LoggingSeverityError < StandardError; end
    class EnvironmentError < StandardError; end
  end
end
