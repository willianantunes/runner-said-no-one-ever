require('spec_helper')

RSpec.describe(Controllers::API::V1::DiabloController) do
  REQUEST_PATH = '/api/v1/deckard-cain'.freeze

  def app
    RunnerSaidNoOneEver
  end

  context 'When talk to cain' do
    it 'should say the classical phrase without your name' do
      get REQUEST_PATH
      expect(last_response).to(be_ok)
      expect(last_response.body).to(eq('Hello World My Friend! Stay awhile and listen'))
    end

    it 'should say the a custom classical phrase given you provided your name' do
      my_name = 'Jafar'
      get REQUEST_PATH, name: my_name
      expect(last_response).to(be_ok)
      expect(last_response.body).to(eq("Hello World #{my_name}! Stay awhile and listen"))
    end
  end
end
