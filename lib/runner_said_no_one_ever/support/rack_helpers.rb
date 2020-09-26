# https://github.com/rack/rack/blob/master/SPEC.rdoc
# https://github.com/willianantunes/talkdesk-code-challenge/blob/master/gunicorn_config.py
# https://stackoverflow.com/a/3184487/3899136

module Support
  class JsonCommonLogger
    def initialize(app, logger = nil, &custom_log)
      @app = app
      @logger = logger
      @custom_log = custom_log
    end

    def call(env)
      start_at = Time.now
      status, header, body = @app.call(env)
      header = Rack::Utils::HeaderHash.new(header)
      body = Rack::BodyProxy.new(body) { log(env, status, header, start_at) }
      [status, header, body]
    end

    def log(env, status, header, began_at)
      now = Time.now
      length = extract_content_length(header)

      ip_address_header = ENV['RACK_IP_ADDRESS_HEADER'] || 'HTTP_X_FORWARDED_FOR'
      request_id_header = ENV['RACK_REQUEST_ID_HEADER'] || 'HTTP_X_REQUEST_ID'

      message = {
        ip_address: env[ip_address_header] || nil,
        registered_at: now.iso8601(3),
        process_pid: Process.pid,
        thread_id: Thread.current.object_id,
        request_id: env[request_id_header] || nil,
        method: env['REQUEST_METHOD'],
        path: env['PATH_INFO'],
        query: env['QUERY_STRING'].empty? ? nil : "?#{env['QUERY_STRING']}",
        version: env['HTTP_VERSION'],
        status: status.to_s[0..3],
        response_length: length,
        referer: env['HTTP_REFERER'] || nil,
        user_agent: env['HTTP_USER_AGENT'] || nil,
        request_time: now - began_at
      }

      message = @custom_log.call(message, status, header, env) if @custom_log

      logger = @logger || env['rack.errors']
      record = "#{message.to_json}\n"

      if logger.respond_to?(:write)
        logger.write(record)
      else
        logger << record
      end
    end

    def extract_content_length(headers)
      value = headers['Content-Length'] or return '-'
      value.to_s == '0' ? '-' : value
    end
  end
end

#      "levelname": "INFO",
#       "asctime": "2020-09-21 22:45:10,641",
#       "request_id": "e28fe73e9d16951dadb59ecc60348e25",
#       "session_id": "4e58fa274854a42c6769291187aa12b2f52341d8",
#       "name": "gunicorn.access",
#       "message": "GET /api/v1/purchase-receipt/pre-signed-url/388bf184-33c2-464c-9cba-b46aadb397f0 HTTP/1.1",
#       "http_status": 200,
#       "ip_address": "2804:14c:8585:541b:241b:510e:861f:41c9, 187.123.30.14, 23.63.247.22",
#       "response_length": "281",
#       "referer": "-",
#       "user_agent": "okhttp/3.12.1",
#       "request_time": 0.19063,
#       "date": "[21/Sep/2020:22:45:10 +0000]"
