require('spec_helper')

RSpec.describe(Business::FilmSpecialist) do
  context 'when argued about what he knows' do
    it 'should retrieve a random character and movie' do
      character_and_movie = Business::FilmSpecialist.yell_a_character_and_its_movie

      # TODO: Assert if at least one guy from the movies was indeed called
      expect(character_and_movie.size).to(be(2))
    end
  end
end
