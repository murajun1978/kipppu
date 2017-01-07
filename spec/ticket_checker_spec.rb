require 'spec_helper'

describe Kippu::TicketChecker do
  let(:ticket_checker) { Kippu::TicketChecker.new(station: station) }
  let(:ticket) { spy('ticket') }

  describe 'admit' do
    let(:station) { 'umeda' }

    example do 
      expect(ticket_checker.admit(ticket)).to be true
    end
  end

  describe 'out' do
    let(:station) { 'jyuso' }

    example do 
      expect(ticket_checker.out(ticket)).to be true
    end
  end

  describe 'scenario 1' do
    example do 
      ticket = Kippu::Ticket.new(fare: 150)
      umeda_ticket_checker = Kippu::TicketChecker.new(station: 'umeda')
      jyuso_ticket_checker = Kippu::TicketChecker.new(station: 'jyuso')

      expect(umeda_ticket_checker.admit(ticket)).to be true
      expect(jyuso_ticket_checker.out(ticket)).to be true
    end
  end
end
