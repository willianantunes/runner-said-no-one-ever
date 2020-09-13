require('bundler/setup')

# https://bundler.io/guides/bundler_setup.html
# https://bundler.io/guides/groups.html
Bundler.require(:default)

# TODO: Seek a better way to do it
require_relative('./lib/runner_said_no_one_ever')

run(RunnerSaidNoOneEver)
