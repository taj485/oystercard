#!/bin/env ruby
# encoding: utf-8

class Oystercard
  attr_accessor :balance
  attr_reader :in_journey
  BALANCE_LIMIT = 90
  MINIMUM_Balance = 1

  def initialize(balance = 0, in_journey = false)
    @balance = balance
    @in_journey = in_journey
  end

  def top_up(amount)
    raise "You can only top up maximum £90 on your oystercard" if amount > BALANCE_LIMIT
    if under_balance_limit?(amount)
      self.balance += amount  #self = oystercard.balance
    else
      raise "you can only have a maximum credit of £90"
    end
  end

  def deduct(amount)
    self.balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def under_balance_limit?(amount)
    (@balance + amount) <= BALANCE_LIMIT
  end

end
