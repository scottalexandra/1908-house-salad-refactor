class SearchResult
  def initialize(state)
    @state = state
  end

  def member_count
    members.count
  end

  def members
    service = PropublicaService.new
    raw_member_data = service.get_members(state)


  
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['PROPUBLICA_API_KEY']
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    raw_member_data = JSON.parse(response.body, symbolize_names: true)[:results]

    raw_member_data.map do |member|
      Member.new(member)
    end
  end

  private
  attr_reader :state
end
