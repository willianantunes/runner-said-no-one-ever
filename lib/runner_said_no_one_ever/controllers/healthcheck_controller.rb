module Controllers
  class HealthCheckController < CustomSinatraBase
    get '/health-check' do
      content_type :json
      { health: true }.to_json
    end
  end
end
