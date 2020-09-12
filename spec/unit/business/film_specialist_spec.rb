require('spec_helper')

RSpec.describe(Business::FilmSpecialist) do
  subject(:film_specialist) { Business::FilmSpecialist }

  context 'when argued about what he knows' do
    it 'should retrieve a random character and movie' do
      character_and_movie = film_specialist.yell_a_character_and_its_movie

      # TODO: Assert if at least one guy from the movies was indeed called
      expect(character_and_movie.size).to(be(2))
    end

    it 'should retrieve a random character given desired movie' do
      some_character = film_specialist.random_character('LordOfTheRings')

      expect(some_character).not_to(be_empty)
    end
  end
end
