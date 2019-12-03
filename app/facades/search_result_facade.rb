class SearchResultFacade
  def initialize(state)
    @state = state
  end

  def member_count
    members.count
  end

  def members
    raw_member_data = get_members
    create_members(raw_member_data)
  end

  def get_members
    @data ||= service.get_house_members(state)
  end

  private

  def service
    PropublicaService.new
  end

  attr_reader :state

  def create_members(raw_member_data)
    raw_member_data.map do |member|
      Member.new(member)
    end
  end
end
