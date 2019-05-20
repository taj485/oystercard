require 'oystercard.rb'

describe Oystercard do
let(:card) {Oystercard.new}

  it "can create an instance of it self with default balance of 0" do
    expect(card.balance).to eql(0)
  end


 #money on card
 #add money to my card
 #dont want to put to much money on my card
 #need fare deducted from ym card
 #tounch in and touch out to get through barriers
 #need to have a minimum ammount for a single journey
 #pay for journey when complete
 #need to know where i have travled from
 #see all previous trips
 #what zone a station is in
 #penalty charge deducted if i fail to touch in or out
 #need to have the correct fare calcualted
end
