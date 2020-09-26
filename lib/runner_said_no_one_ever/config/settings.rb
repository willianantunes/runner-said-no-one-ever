module Config
  class Settings
    include Support::Utils

    PUMA_BIND_ADDRESS = get_env_or_raise_exception('PUMA_BIND_ADDRESS')
    public_constant :PUMA_BIND_ADDRESS
    PUMA_BIND_PORT = get_env_or_raise_exception('PUMA_BIND_PORT').to_i
    public_constant :PUMA_BIND_PORT
    PUMA_MIN_THREADS = get_env_or_raise_exception('PUMA_MIN_THREADS').to_i
    public_constant :PUMA_MIN_THREADS
    PUMA_MAX_THREADS = get_env_or_raise_exception('PUMA_MAX_THREADS').to_i
    public_constant :PUMA_MAX_THREADS
    PUMA_NUMBER_OF_WORKERS = get_env_or_raise_exception('PUMA_NUMBER_OF_WORKERS').to_i
    public_constant :PUMA_NUMBER_OF_WORKERS
    PUMA_PERSISTENT_TIMEOUT = get_env_or_raise_exception('PUMA_PERSISTENT_TIMEOUT').to_i
    public_constant :PUMA_PERSISTENT_TIMEOUT
    PUMA_FIRST_DATA_TIMEOUT = get_env_or_raise_exception('PUMA_FIRST_DATA_TIMEOUT').to_i
    public_constant :PUMA_FIRST_DATA_TIMEOUT
    DELAY_ANSWER_IN_SECONDS = ENV.fetch('DELAY_ANSWER_IN_SECONDS', 1).to_i
    public_constant :DELAY_ANSWER_IN_SECONDS
    RACK_ENV = get_env_or_raise_exception('RACK_ENV').to_sym
    public_constant :RACK_ENV
    PROJECT_LOG_LEVEL = logging_severity(get_env_or_raise_exception('PROJECT_LOG_LEVEL').upcase.to_sym)
    public_constant :PROJECT_LOG_LEVEL
  end
end
