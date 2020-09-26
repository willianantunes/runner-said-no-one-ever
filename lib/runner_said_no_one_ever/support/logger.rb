module Support
  class LogHelper
    class << self
      def get_logger(_name)
        # TODO
        Logger.new($stdout)
      end
    end
  end
end
