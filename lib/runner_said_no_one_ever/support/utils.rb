module Support
  class Utils
    class << self
      def get_env_or_raise_exception(name)
        ENV[name] || raise(EnvironmentError, "Environment variable #{name} is not set!")
      end
    end
  end

  class EnvironmentError < StandardError; end
end
