# https://github.com/puma/puma/tree/master/test/config
# https://stackoverflow.com/a/21348873/3899136
# https://github.com/puma/puma/blob/master/lib/puma/dsl.rb
# https://github.com/puma/puma/blob/7d00e1dc3c71b77ea171f503e6c9be24836314eb/lib/puma/const.rb#L101

# This is needed cause puma loads this file directly
require('json')
require('logger')
require_relative('../support/utils')
require_relative('settings')

bind("tcp://#{Config::Settings::PUMA_BIND_ADDRESS}:#{Config::Settings::PUMA_BIND_PORT}")
threads(Config::Settings::PUMA_MIN_THREADS, Config::Settings::PUMA_MAX_THREADS)
workers(Config::Settings::PUMA_NUMBER_OF_WORKERS)
# The default number of seconds for another request within a persistent session.
persistent_timeout(Config::Settings::PUMA_PERSISTENT_TIMEOUT)
# The default number of seconds to wait until we get the first data for the request
first_data_timeout(Config::Settings::PUMA_FIRST_DATA_TIMEOUT)

# https://gitlab.com/gitlab-org/omnibus-gitlab/-/merge_requests/3785
# https://gitlab.com/gitlab-org/gitlab-foss/-/blob/90859e80ca23b8709d56b60d2066b569053e7e02/lib/gitlab/puma_logging/json_formatter.rb
# https://gitlab.com/gitlab-org/omnibus-gitlab/-/blob/41f50d95fc2bb9878e31df27910bc85cad42080e/files/gitlab-cookbooks/gitlab/templates/default/puma.rb.erb#L91

if Config::Settings::RACK_ENV == :production
  log_formatter do |msg|
    {
      registered_at: Time.now.iso8601(3),
      pid: Process.pid,
      thread_id: Thread.current.object_id,
      message: msg
    }.to_json
  end
end
