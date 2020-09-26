require('spec_helper')

RSpec.describe(Support::JsonCommonLogger) do
  let(:logger) { spy('logger') }

  def json_commonlogger(app)
    Rack::Lint.new(Support::JsonCommonLogger.new(app, logger))
  end

  def json_custom_commonlogger(app)
    Rack::Lint.new(Support::JsonCommonLogger.new(app, logger) { |_log| { jafar: 'iago' } })
  end

  it 'Should write to the standard log' do
    # https://stackoverflow.com/a/10004344/3899136
    header_key = 'Content-Type'
    header_value = 'text/plain'

    req = Rack::MockRequest.new(
      json_commonlogger(
        ->(_env) { [200, { header_key => header_value }, ['Hello Aladdin!']] }
      )
    )

    # TODO: Assert what was received
    # TODO: Emulate user-agent and other properties
    expect(logger).to(receive(:write).exactly(1).times)

    req.get('/')
  end

  it 'should write to a custom log' do
    header_key = 'Content-Type'
    header_value = 'text/plain'

    req = Rack::MockRequest.new(
      json_custom_commonlogger(
        ->(_env) { [200, { header_key => header_value }, ['Hello Cockatiel']] }
      )
    )

    expect(logger).to(receive(:write).with("#{{ jafar: 'iago' }.to_json}\n"))
    expect(logger).to(receive(:write).exactly(0).times)

    req.get('/')
  end
end
