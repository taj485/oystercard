class Journey
  attr_reader :entry_station, :history, :exit_sation
  def initialize
    @entry_station = nil
    @history = []
    @exit_station = nil
  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def end_journey(exit_sation)
    @exit_sation = exit_sation
    @history.push({:entry => @entry_station, :exit => @exit_sation})
    @entry_station = nil
  end

end
