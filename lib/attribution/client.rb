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
      execute_request Attribution::Request.post(path, payload_hash)
    end

    private
    def execute_request(request)
      result = request.execute(base_url, username: @project_id)
      result
    end
  end
end
