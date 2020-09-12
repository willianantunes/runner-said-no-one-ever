# require('runner_said_no_one_ever/version')
require('sinatra')

# module RunnerSaidNoOneEver
#   get '/' do
#     "Hello World #{params[:name]}".strip
#   end
# end

get '/' do
  "Hello World #{params[:name]}".strip
end
