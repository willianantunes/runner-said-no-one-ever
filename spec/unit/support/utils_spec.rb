require('spec_helper')

RSpec.describe(Support::Utils) do
  context 'when a environment variable is needed' do
    it 'should retrieve the variable' do
      env_key = 'AWS_ACCESS_KEY_ID'
      env_value = 'JAFAR'

      stub_const('ENV', ENV.to_hash.merge(env_key => env_value))

      value = Support::Utils.get_env_or_raise_exception(env_key)

      expect(value).to(eq(env_value))
    end

    it 'should raise an error given the variable is not set' do
      env_key = 'XPTO_FAKE_KEY'

      attempt_to_get_env =
        lambda {
          Support::Utils.get_env_or_raise_exception(env_key)
        }

      expected_exception_message = "Environment variable #{env_key} is not set!"
      expect { attempt_to_get_env.call }.to(raise_error(Support::EnvironmentError, expected_exception_message))
    end
  end
end
