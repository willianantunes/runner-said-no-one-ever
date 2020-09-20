# https://github.com/puma/puma/tree/master/test/config
# https://stackoverflow.com/a/21348873/3899136
# https://github.com/puma/puma/blob/master/lib/puma/dsl.rb
# https://github.com/puma/puma/blob/7d00e1dc3c71b77ea171f503e6c9be24836314eb/lib/puma/const.rb#L101

# This is needed cause puma loads this file directly
require_relative('../support/utils')
require_relative('settings')

bind("tcp://#{Config::Settings::PUMA_BIND_ADDRESS}:#{Config::Settings::PUMA_BIND_PORT}")
threads(Config::Settings::PUMA_MIN_THREADS, Config::Settings::PUMA_MAX_THREADS)
workers(Config::Settings::PUMA_NUMBER_OF_WORKERS)
daemonize(false)
# The default number of seconds for another request within a persistent session.
persistent_timeout(Config::Settings::PUMA_PERSISTENT_TIMEOUT)
# The default number of seconds to wait until we get the first data for the request
first_data_timeout(Config::Settings::PUMA_FIRST_DATA_TIMEOUT)
