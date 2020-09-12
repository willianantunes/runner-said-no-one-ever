module Controllers
  module API
    module V1
      class MoviesController < CustomSinatraBase
        get '/' do
          "Hello World #{params[:name]}".strip
        end

        namespace '/api/v1' do
          get '/movies' do
            "Hello World #{params[:name]}".strip
          end
        end
      end
    end
  end
end
