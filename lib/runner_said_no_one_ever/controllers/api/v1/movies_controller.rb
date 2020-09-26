module Controllers
  module API
    module V1
      class MoviesController < CustomSinatraBase
        include Support::LogHelper
        film_specialist = Business::FilmSpecialist

        namespace '/api/v1' do
          get '/movies' do
            logger.info('Asking film specialist...')
            character, movie = film_specialist.yell_a_character_and_its_movie

            # TODO: Allow the value to be customized through query string
            duration = Config::Settings::DELAY_ANSWER_IN_SECONDS
            logger.info("Sleeping the following number of seconds: #{duration}")
            sleep duration

            logger.debug("Character and movie: #{character} / #{movie}")
            content_type :json
            { character: character, movie: movie }.to_json
          end

          get '/movies/star-wars' do
            status 501
          end
        end
      end
    end
  end
end
