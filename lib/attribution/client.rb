require 'faraday'
module Attribution
  class Client
    def base_url
      'https://track.attributionapp.com'
    end

    def initialize(project_id)
      @project_id = project_id
    end

    def track(data)
      post('/track', data)
    end

    def post(path, payload_hash)
      conn = Faraday.new(:url => base_url) do |faraday|
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      response = conn.post do |req|
        req.url path
        req.headers['Content-Type'] = 'application/json'
        req.headers['User-Agent'] = 'Attribution-Ruby/0.0.1'
        req.body = payload_hash.to_json
      end
      raise "#{response.inspect}" unless response.success?
    end
  end
end
