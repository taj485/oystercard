class Journey
  attr_reader :entry_station
  def initialize
    @entry_station = nil
    @journeys = []
  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_sation)
    @exit_sation = exit_sation
    @journeys.push({:entry => @entry_station, :exit => @exit_sation})
    @entry_station = nil
  end

end
