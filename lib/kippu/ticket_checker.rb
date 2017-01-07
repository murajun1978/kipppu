module Kippu
  class TicketChecker
    attr_reader :station

    def initialize(args={})
      @station = args[:station]
    end

    def admit(ticket)
      true
    end

    def out(ticket)
      true
    end
  end
end