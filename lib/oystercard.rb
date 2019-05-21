#!/bin/env ruby
# encoding: utf-8

class Oystercard
  attr_accessor :balance
  attr_reader :in_journey, :entry_station
  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize(balance = 0, in_journey = false)
    @balance = balance
    @in_journey = in_journey
    @entry_station = nil
  end

  def top_up(amount)
    raise "You can only top up maximum £#{BALANCE_LIMIT} on your oystercard" if amount > BALANCE_LIMIT
    raise "you can only have a maximum credit of £#{BALANCE_LIMIT}" if over_balance_limit?(amount)
    self.balance += amount  #self = oystercard.balance
  end


  def touch_in(entry_station)
    raise 'Card does not have minumum fare loaded!' if balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = entry_station
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  private

  def over_balance_limit?(amount)
    (@balance + amount) > BALANCE_LIMIT
  end

  def deduct(amount)
    self.balance -= amount
  end

end
