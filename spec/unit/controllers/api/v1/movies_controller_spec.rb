require('spec_helper')

RSpec.describe(Controllers::API::V1::MoviesController) do
  REQUEST_PATH = '/api/v1/movies'.freeze

  def app
    RunnerSaidNoOneEver
  end

  context 'When asked details about a movie' do
    it 'should receive 501 as it is not implemented yet' do
      get REQUEST_PATH
      expect(last_response.status).to(be(501))
    end
  end
end
