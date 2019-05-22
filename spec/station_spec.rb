require 'station'

describe Station do
  let(:station) {Station.new("euston", "zone1")}
  it "can create and instance of station with a name" do
    expect(station.name).to eql("euston")
  end

  it "can create and instance of station with a zone" do
    expect(station.zone).to eql("zone1")
  end

end
