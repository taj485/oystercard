class Journey
  attr_reader :entry_station
  def initialize
    @entry_station = nil
    @journeys = []
  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end
end