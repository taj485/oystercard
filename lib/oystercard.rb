class Oystercard
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    raise "You can only top up maximum £90 on your oystercard" if amount > 90
    @balance += amount if @balance < 90
    raise "you can only have a maximum credit of £90" if @balance > 90
  end
end
