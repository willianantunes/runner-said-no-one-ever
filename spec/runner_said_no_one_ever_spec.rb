require('spec_helper')

RSpec.describe('Something') do
  def app
    RunnerSaidNoOneEver
  end

  it 'says hello' do
    get '/'
    expect(last_response).to(be_ok)
    expect(last_response.body).to(eq('Hello World'))
  end

  it 'says hello to a person' do
    get '/', name: 'Jafar'
    expect(last_response).to(be_ok)
    expect(last_response.body).to(eq('Hello World Jafar'))
  end

  it 'says hello api/v1/movies' do
    get '/api/v1/movies'
    expect(last_response).to(be_ok)
    expect(last_response.body).to(eq('Hello World'))
  end

  it 'says hello to a person api/v1/movies' do
    get '/api/v1/movies', name: 'Jafar'
    expect(last_response).to(be_ok)
    expect(last_response.body).to(eq('Hello World Jafar'))
  end
end
