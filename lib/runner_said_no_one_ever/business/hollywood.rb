module Business
  class FilmSpecialist
    include Support::LogHelper

    class << self
      def yell_a_character_and_its_movie
        logger.debug('Consulting movies warehouse...')
        selected_movie = MoviesWarehouse.some_movie_from_the_shelf
        random_character = selected_movie.first.character
        [random_character, selected_movie.last]
      end

      def random_character(movie_name)
        return if movie_name.empty?

        logger.debug("Choosing random character from movie #{movie_name}")
        selected_movie = MoviesWarehouse.specific_movie(movie_name)
        selected_movie&.first&.character
      end
    end
  end

  class MoviesWarehouse
    MOVIES = [
      Faker::Movies::BackToTheFuture,
      Faker::Movies::Departed,
      Faker::Movies::Ghostbusters,
      Faker::Movies::HarryPotter,
      Faker::Movies::HitchhikersGuideToTheGalaxy,
      Faker::Movies::Hobbit,
      Faker::Movies::Lebowski,
      Faker::Movies::LordOfTheRings,
      Faker::Movies::PrincessBride,
      Faker::Movies::StarWars,
      Faker::Movies::VForVendetta
    ].map { |entry| [entry, entry.name.split('::').last] }.freeze

    private_constant :MOVIES

    class << self
      def some_movie_from_the_shelf
        MOVIES.sample
      end

      def specific_movie(name)
        MOVIES.find { |entry| entry.last == name }
      end
    end
  end
end
