require('spec_helper')

RSpec.describe(Controllers::HealthCheckController) do
  let(:request_path) { '/health-check' }

  context 'When asked details about its health' do
    it 'should return OK given no problem was found' do
      get request_path

      expected_body = { health: true }
      expect(last_response.status).to(be(200))
      body_as_json = JSON.parse(last_response.body, { symbolize_names: true })
      expect(body_as_json).to(include(**expected_body))
    end
  end
end
