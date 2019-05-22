require 'journey'

describe Journey do
 let(:station_double) {double(:entry_station, :station_name => "Barbican Station")}
 let(:journey) {Journey.new}

  it 'will remember the entry station' do
    journey.start_journey(station_double.station_name)
    expect(journey.entry_station).to eq("Barbican Station")
  end

  it 'will forget the entry station when touched out' do
    journey = Journey.new
    journey.start_journey("Euston")
    journey.end_journey("Barbican")
    expect(journey.entry_station).to eq(nil)
  end

  it 'will have an empty list of journeys by default' do
    expect(card.journeys).to eql([])
  end

  it "touching in and out will create one journey" do
    card.top_up(Oystercard::MINIMUM_FARE)
    card.touch_in(station_double)
    card.touch_out(station_exit_double)
    expect(card.journeys).to eql([{:entry => station_double, :exit => station_exit_double}])
  end
end
