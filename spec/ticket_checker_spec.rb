require 'spec_helper'

describe Kippu::TicketChecker do
  let(:ticket_checker) { Kippu::TicketChecker.new }
  let(:ticket) { spy('ticket') }

  describe 'admit' do
    example do 
      expect(ticket_checker.admit(ticket)).to be true
    end
  end

  describe 'out' do
    example do 
      expect(ticket_checker.out(ticket)).to be true
    end
  end
end
