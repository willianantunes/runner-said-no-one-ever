def configure_environment(env_file_location)
  File.open(env_file_location, 'r').each_line do |line|
    next if line.start_with?('#') || (line == "\n")

    key_and_value = line.chomp("\n").split('=', 2)
    key_and_value[1].gsub!(/^"|"$/, '') if ['\'', '"'].include?(key_and_value[1][0])
    eval("ENV['#{key_and_value[0]}']='#{key_and_value[1] || ''}'") # rubocop:disable Security/Eval, Style/EvalWithLocation
  end
end

configure_environment('.env')

require('simplecov')

SimpleCov.start

require('rack/test')
require('rack/lint')
require('rack/mock')
require('runner_said_no_one_ever')

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end

  config.include(Rack::Test::Methods)

  def app
    RunnerSaidNoOneEver
  end
end
