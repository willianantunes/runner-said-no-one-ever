module Controllers
  module API
    module V1
      class MoviesController < CustomSinatraBase
        namespace '/api/v1' do
          get '/movies' do
            status 501
          end
        end
      end
    end
  end
end
