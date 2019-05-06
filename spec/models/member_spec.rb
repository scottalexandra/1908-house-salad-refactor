 require 'rails_helper'

 describe Member do
   it "has attributes" do
     attributes = {
            name: "Diana DeGette",
            role: "Representative",
            party: "D",
            district: "1",
        }

     member = Member.new(attributes)
     expect(member.name).to eq("Diana DeGette")
     expect(member.role).to eq("Representative")
     expect(member.party).to eq("D")
     expect(member.district).to eq("1")
   end
 end
