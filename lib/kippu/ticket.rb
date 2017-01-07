module Kippu
  class Ticket
    attr_reader :fare 

    def initialize(args={})
      @fare = args[:fare]
    end
  end
end