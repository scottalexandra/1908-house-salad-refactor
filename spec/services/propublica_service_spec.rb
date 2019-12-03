require 'rails_helper'

describe PropublicaService do
  it 'returns members of the house data' do
    service = PropublicaService.new
    raw_member_data = service.get_members('CO')

    expect(raw_member_data[0]).to have_key(:name)
    expect(raw_member_data[0]).to have_key(:role)
    expect(raw_member_data[0]).to have_key(:party)
    expect(raw_member_data[0]).to have_key(:district)
  end
end
