require('sinatra/base')
require('sinatra/namespace')
require_relative('runner_said_no_one_ever/support/sinatra_helpers')
require('faker')
require_relative('runner_said_no_one_ever/business/hollywood')
require_relative('runner_said_no_one_ever/controllers/api/v1/movies_controller')
require_relative('runner_said_no_one_ever/controllers/api/v1/diablo_controller')

class RunnerSaidNoOneEver < Sinatra::Base
  use Controllers::API::V1::MoviesController
  use Controllers::API::V1::DiabloController
end
