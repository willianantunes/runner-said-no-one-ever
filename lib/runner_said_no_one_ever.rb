require('sinatra/base')
require('sinatra/namespace')
require('runner_said_no_one_ever/controllers/api/v1/movies_controller')

class RunnerSaidNoOneEver < Sinatra::Base
  use Controllers::API::V1::MoviesController
end
