#!/bin/env ruby
# encoding: utf-8

require 'oystercard.rb'

describe Oystercard do
let(:card) {Oystercard.new}

  it "can create an instance of it self with default balance of 0" do
    expect(card.balance).to eql(0)
  end

  it 'has the ability to top up' do
    card.top_up(10)
    expect(card.balance).to eql(10)
  end

  it "can top up a maximum of £90" do
    expect{card.top_up(100)}.to raise_error "You can only top up maximum £90 on your oystercard"
  end

  it "will not top up over maximum limit of £90" do
    card.top_up(50)
    expect {card.top_up(50)}. to raise_error "you can only have a maximum credit of £90"
  end

  it 'can deduct fare from card' do
    card.top_up(80)
    card.deduct(40)
    expect(card.balance).to eq(40)
  end

  it 'does something'
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
