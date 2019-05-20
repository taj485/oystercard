require_relative '../lib/oystercard.rb'

card = Oystercard.new

card.top_up(80)
# => 80

card.deduct(40)
# => 40