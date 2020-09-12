module Business
  class FilmSpecialist
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

    def self.yell_a_character_and_its_movie
      selected_movie = MOVIES.sample
      random_character = selected_movie.first.character
      return random_character, selected_movie.last
    end

    def self.random_character(movie_name)
      return unless movie_name.empty?

      selected_movie = MOVIES.find { |entry| entry.last == movie_name }
      return selected_movie.first.character if selected_movie
    end
  end
end
