#!/bin/env ruby
# encoding: utf-8

require 'oystercard.rb'

describe Oystercard do
let(:card) {Oystercard.new}
let(:station_double) { double('station double', station_name: "Barbican") }
let(:station_exit_double) { double('station exit double', station_name: "Euston") }

  it "can create an instance of it self with default balance of 0" do
    expect(card.balance).to eql(0)
  end

  it 'has the ability to top up' do
    card.top_up(10)
    expect(card.balance).to eql(10)
  end

  # this is a duplicate test of the one below => if balance tries to go above £90, error will be raised regardless
  # it "can top up a maximum of £90" do
  #   expect{card.top_up(100)}.to raise_error "You can only top up maximum £90 on your oystercard"
  # end

  it "will not top up over maximum limit of £90" do
    card.top_up(50)
    expect {card.top_up(50)}. to raise_error "you can only have a maximum credit of £90"
  end

  it 'can initialize card journey status as false' do
    expect(card.in_journey).to eql (false)
  end

  it 'can touch in and start journey' do
    card.top_up(Oystercard::MINIMUM_BALANCE)
    card.touch_in(station_double)
    expect(card.in_journey).to eql(true)
  end

  it 'can touch out and end journey' do
    card.top_up(10)
    card.touch_in(station_double)
    card.touch_out(station_exit_double)
    expect(card.in_journey).to eql(false)
  end

  it 'will raise an error if card touches in with less than minimum fare' do
    expect { card.touch_in(station_double) }.to raise_error 'Card does not have minumum fare loaded!'
  end

  it "will reduce balance once card is touched out" do
    card.top_up(Oystercard::MINIMUM_FARE)
    card.touch_in(station_double)
    expect { card.touch_out(station_exit_double) }.to change{ card.balance }.by ( - Oystercard::MINIMUM_FARE)
  end

  # it 'will remember the entry station' do
  #   card.top_up(Oystercard::MINIMUM_FARE)
  #   card.touch_in(station_double)
  #   expect(card.entry_station).to eq(station_double)
  # end

  # it 'will forget the entry station when touched out' do
  #   card.top_up(Oystercard::MINIMUM_FARE)
  #   card.touch_in(station_double)

  #   card.touch_out(station_exit_double)

  #   expect(card.entry_station).to eq(nil)
  # end

  # it 'will have an empty list of journeys by default' do
  #   expect(card.journeys).to eql([])
  # end

  # it "touching in and out will create one journey" do
  #   card.top_up(Oystercard::MINIMUM_FARE)
  #   card.touch_in(station_double)
  #   card.touch_out(station_exit_double)
  #   expect(card.journeys).to eql([{:entry => station_double, :exit => station_exit_double}])
  # end
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
