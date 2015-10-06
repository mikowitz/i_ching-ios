module Api
  extend self

  def fetch_hexagrams(&block)
    client.get("hexagrams") do |result|
      if result.success?
        block.call result.object
      else
        mp "Api.fetch_hexagrams => #{result.error.localizedDescription}"
      end
    end
  end

  private

  def base_url
    Settings.api_url + "/v" + Settings.current_api_version + "/"
  end

  def client
    @client ||= AFMotion::Client.build(base_url) do
      header "Accept", "application/json"

      response_serializer :json
    end
  end
end
