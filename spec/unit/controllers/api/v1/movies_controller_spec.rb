require('spec_helper')

RSpec.describe(Controllers::API::V1::MoviesController) do
  let(:request_path) { '/api/v1/movies' }

  context 'When asked details about the topic' do
    it 'should return a random character and its movie' do
      controller_class = Controllers::API::V1::MoviesController

      allow_any_instance_of(controller_class).to(receive(:sleep))
      expect_any_instance_of(controller_class).to(receive(:sleep).with(1))
      fake_value = %w[Jafar Aladdin]
      expect(Business::FilmSpecialist).to(receive(:yell_a_character_and_its_movie).and_return(fake_value))

      get request_path

      expected_body = { "character": fake_value.first, "movie": fake_value.last }
      expect(last_response.status).to(be(200))
      body_as_json = JSON.parse(last_response.body, { symbolize_names: true })
      expect(body_as_json).to(include(**expected_body))
    end
  end
end
