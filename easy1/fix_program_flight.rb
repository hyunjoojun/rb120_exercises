class Flight
  def initialize(database_handle, flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
