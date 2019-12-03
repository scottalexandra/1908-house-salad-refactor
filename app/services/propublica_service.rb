class PropublicaService

  def get_house_members(state)
    response = fetch_data("/congress/v1/members/house/#{state}/current.json")
    parse_data(response)[:results]
  end

  private

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def fetch_data(url)
    conn.get(url)
  end

  def conn
    Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['PROPUBLICA_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
