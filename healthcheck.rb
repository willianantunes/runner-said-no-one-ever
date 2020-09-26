require('net/http')

address = ENV['PUMA_BIND_ADDRESS'] || 'localhost'
port = ENV['PUMA_BIND_PORT'] || 9292

http_class = Net::HTTP
target_address = URI.parse("http://#{address}:#{port}/health-check")
request_setup = { open_timeout: 5, read_timeout: 5 }
get_configuration = http_class::Get.new(target_address.to_s)

response =
  http_class.start(target_address.host, target_address.port, **request_setup) do |session|
    session.request(get_configuration)
  end

if response.code.to_i == 200
  exit(0)
else
  exit(1)
end
