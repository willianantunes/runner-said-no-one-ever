module Controllers
  module API
    module V1
      class DiabloController < CustomSinatraBase
        namespace '/api/v1' do
          get '/deckard-cain' do
            name_deckard_will_use = params[:name]&.strip || 'My Friend'
            "Hello World #{name_deckard_will_use}! Stay awhile and listen"
          end
        end
      end
    end
  end
end
