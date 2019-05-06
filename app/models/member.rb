class Member
  attr_reader :district, :name, :party, :role
  def initialize(data)
    @district = data[:district]
    @name     = data[:name]
    @party    = data[:party]
    @role     = data[:role]
  end
end

