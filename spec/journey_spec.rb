require 'journey'

describe Journey do
 let(:station_double) {double(:entry_station, :station_name => "Barbican Station")}
 let(:station_exit_double) {double(:exit_station, :station_name => "Euston")}
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
    expect(journey.history).to eql([])
  end

  it "touching in and out will create one journey" do
    journey.start_journey(station_double.station_name)
    journey.end_journey(station_exit_double.station_name)
    expect(journey.history).to eql([{:entry => "Barbican Station", :exit => "Euston"}])
  end
end
