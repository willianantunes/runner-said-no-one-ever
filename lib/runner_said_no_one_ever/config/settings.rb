module Config
  class Settings
    PUMA_BIND_ADDRESS = Support::Utils.get_env_or_raise_exception('PUMA_BIND_ADDRESS')
    PUMA_BIND_PORT = Support::Utils.get_env_or_raise_exception('PUMA_BIND_PORT').to_i
    PUMA_MIN_THREADS = Support::Utils.get_env_or_raise_exception('PUMA_MIN_THREADS').to_i
    PUMA_MAX_THREADS = Support::Utils.get_env_or_raise_exception('PUMA_MAX_THREADS').to_i
    PUMA_NUMBER_OF_WORKERS = Support::Utils.get_env_or_raise_exception('PUMA_NUMBER_OF_WORKERS').to_i
    PUMA_PERSISTENT_TIMEOUT = Support::Utils.get_env_or_raise_exception('PUMA_PERSISTENT_TIMEOUT').to_i
    PUMA_FIRST_DATA_TIMEOUT = Support::Utils.get_env_or_raise_exception('PUMA_FIRST_DATA_TIMEOUT').to_i
  end
end
