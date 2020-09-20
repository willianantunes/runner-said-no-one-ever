require('spec_helper')

RSpec.describe(Business::FilmSpecialist) do
  subject(:film_specialist) { Business::FilmSpecialist }

  context 'when argued about what he knows' do
    it 'should retrieve a random character and movie' do
      movie_class = Faker::Movies::BackToTheFuture
      fake_value = [movie_class, movie_class.name.split('::').last]
      fake_character_name = 'Cockatiel'

      expect(movie_class).to(receive(:character).and_return(fake_character_name))
      expect(Business::MoviesWarehouse).to(receive(:some_movie_from_the_shelf).and_return(fake_value))

      character_and_movie = film_specialist.yell_a_character_and_its_movie

      expect(character_and_movie.size).to(be(2))
      expect(character_and_movie).to(contain_exactly(fake_character_name, fake_value.last))
    end

    it 'should retrieve a random character given desired movie' do
      movie_name = 'LordOfTheRings'

      movie_class = Faker::Movies::LordOfTheRings
      fake_value = [movie_class, movie_class.name.split('::').last]
      fake_character_name = 'Cockatiel'

      expect(movie_class).to(receive(:character).and_return(fake_character_name))
      expect(Business::MoviesWarehouse).to(receive(:specific_movie).with(movie_name).and_return(fake_value))

      some_character = film_specialist.random_character(movie_name)

      expect(some_character).to(eq(fake_character_name))
    end
  end
end
