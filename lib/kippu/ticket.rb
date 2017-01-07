module Kippu
  class Ticket
    attr_reader :fare 
    attr_accessor :admission_station

    def initialize(args={})
      @fare = args[:fare]
    end
  end
end