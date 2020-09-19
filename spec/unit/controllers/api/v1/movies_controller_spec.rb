require('spec_helper')

RSpec.describe(Controllers::API::V1::MoviesController) do
  let(:request_path) { '/api/v1/movies' }

  context 'When asked details about a movie' do
    it 'should receive 501 as it is not implemented yet' do
      get request_path
      expect(last_response.status).to(be(501))
    end
  end
end
