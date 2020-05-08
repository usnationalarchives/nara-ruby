module Nara
  # Error accessing the National Archives API.
  class ApiError < StandardError; end
  class NotFound < StandardError; end

  class Records < Hashie::Mash

    def self.search(params={})
      search_records(params)
    end

    private

    def search_records(params)
      path = version
      result = fetch(path, params)    
      result['opaResponse']['results']['result']
    end

    def version; "v1" end
    def base_url; "https://catalog.archives.gov/api" end

    def faraday
      Faraday.new(
        base_url,
        headers: {:user_agent => "nara-ruby (Faraday v#{Faraday::VERSION})", :accept => 'application/json'}
      ) do |faraday|
        # faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

    def fetch(path, params={})    
      params = {:action => "search"}.merge(params)
      response = faraday.get(path, params)
      
      if response.success?
        if response.headers['content-type'] =~ /json/
          JSON.parse(response.body)
        else
          raise ApiError.new("Response is not JSON: #{response.body}")
        end
      elsif response.status == 404
        raise NotFound.new("This resource was not found: #{path}")
      else
        if response.headers['content-type'] =~ /json/
          parsed = JSON.parse(response.body)          
          details = parsed['Message'] || parsed['ReturnMessage']
        else
          details = response.body
        end
        raise ApiError.new("#{response.status}: #{details}")
      end
    end

  end
end
