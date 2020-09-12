require('spec_helper')

RSpec.describe('Something') do
  def app
    Sinatra::Application
  end

  it 'says hello' do
    get '/'
    expect(last_response).to(be_ok)
    expect(last_response.body).to(eq('Hello World'))
  end
end
