require('sinatra/base')
require('sinatra/namespace')
require_relative('runner_said_no_one_ever/support/utils')
require_relative('runner_said_no_one_ever/support/sinatra_helpers')
require('faker')
require('json')
require_relative('runner_said_no_one_ever/business/hollywood')
require_relative('runner_said_no_one_ever/controllers/healthcheck_controller')
require_relative('runner_said_no_one_ever/controllers/api/v1/movies_controller')
require_relative('runner_said_no_one_ever/controllers/api/v1/diablo_controller')

class RunnerSaidNoOneEver < Sinatra::Base
  use Controllers::API::V1::MoviesController
  use Controllers::API::V1::DiabloController
  use Controllers::HealthCheckController
end
