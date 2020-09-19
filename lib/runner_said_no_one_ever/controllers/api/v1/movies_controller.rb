module Controllers
  module API
    module V1
      class MoviesController < CustomSinatraBase
        film_specialist = Business::FilmSpecialist

        namespace '/api/v1' do
          get '/movies' do
            character, movie = film_specialist.yell_a_character_and_its_movie

            # TODO: Get the value from ENVIRONMENT
            # TODO: Allow the value to be customized through query string
            sleep 1

            content_type :json
            { character: character, movie: movie }.to_json
          end
        end
      end
    end
  end
end
