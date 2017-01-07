module Kippu
  class TicketChecker
    attr_reader :station

    FARE_LIST = [0, 150, 180, 220]
    STATIONS = ['umeda', 'jyuso', 'syonai', 'okamachi']

    def initialize(args={})
      @station = args[:station]
    end

    def admit(ticket)
      ticket.admission_station = station
      true
    end

    def out(ticket)
      # FIXME: refactoring
      start_section = STATIONS.index(ticket.admission_station)
      section = stop_section - start_section
      section = section * -1 if section < 0
      fare = FARE_LIST[(stop_section - start_section)]
      
      ticket.fare >= fare
    end

    private 

      def stop_section
        STATIONS.index(station)
      end
  end
end