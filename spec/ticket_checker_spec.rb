require 'spec_helper'

describe Kippu::TicketChecker do
  let(:ticket_checker) { Kippu::TicketChecker.new(station: station) }
  let(:ticket) { Kippu::Ticket.new(fare: fare) }
  let(:fare) { 150 }

  describe 'admit' do
    let(:station) { 'umeda' }

    example do 
      expect(ticket_checker.admit(ticket)).to be true
    end
  end

  describe 'out' do
    let(:station) { 'jyuso' }

    before do
      allow(ticket).to receive(:admission_station).and_return('umeda')
    end

    context 'ok' do
      example do 
        expect(ticket_checker.out(ticket)).to be true
      end
    end

    context 'lack of fare' do
      let(:station) { 'syonai' }
      
      example do 
        expect(ticket_checker.out(ticket)).to be false
      end
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

  describe 'scenario 2' do
    example do 
      ticket = Kippu::Ticket.new(fare: 150)
      umeda_ticket_checker = Kippu::TicketChecker.new(station: 'umeda')
      syonai_ticket_checker = Kippu::TicketChecker.new(station: 'syonai')

      expect(umeda_ticket_checker.admit(ticket)).to be true
      expect(syonai_ticket_checker.out(ticket)).to be false
    end
  end

  describe 'scenario 3' do
    example do 
      ticket = Kippu::Ticket.new(fare: 180)
      umeda_ticket_checker = Kippu::TicketChecker.new(station: 'umeda')
      syonai_ticket_checker = Kippu::TicketChecker.new(station: 'syonai')

      expect(umeda_ticket_checker.admit(ticket)).to be true
      expect(syonai_ticket_checker.out(ticket)).to be true
    end
  end

  describe 'scenario 4' do
    example do 
      ticket = Kippu::Ticket.new(fare: 220)
      umeda_ticket_checker = Kippu::TicketChecker.new(station: 'umeda')
      syonai_ticket_checker = Kippu::TicketChecker.new(station: 'syonai')

      expect(umeda_ticket_checker.admit(ticket)).to be true
      expect(syonai_ticket_checker.out(ticket)).to be true
    end
  end

  describe 'scenario 5' do
    example do 
      ticket = Kippu::Ticket.new(fare: 180)
      umeda_ticket_checker = Kippu::TicketChecker.new(station: 'umeda')
      okamachi_ticket_checker = Kippu::TicketChecker.new(station: 'okamachi')

      expect(umeda_ticket_checker.admit(ticket)).to be true
      expect(okamachi_ticket_checker.out(ticket)).to be false
    end
  end

  describe 'scenario 6' do
    example do 
      ticket = Kippu::Ticket.new(fare: 220)
      umeda_ticket_checker = Kippu::TicketChecker.new(station: 'umeda')
      okamachi_ticket_checker = Kippu::TicketChecker.new(station: 'okamachi')

      expect(umeda_ticket_checker.admit(ticket)).to be true
      expect(okamachi_ticket_checker.out(ticket)).to be true
    end
  end

  describe 'scenario 7' do
    example do 
      ticket = Kippu::Ticket.new(fare: 150)
      jyuso_ticket_checker = Kippu::TicketChecker.new(station: 'jyuso')
      okamachi_ticket_checker = Kippu::TicketChecker.new(station: 'okamachi')

      expect(jyuso_ticket_checker.admit(ticket)).to be true
      expect(okamachi_ticket_checker.out(ticket)).to be false
    end
  end

  describe 'scenario 8' do
    example do 
      ticket = Kippu::Ticket.new(fare: 180)
      jyuso_ticket_checker = Kippu::TicketChecker.new(station: 'jyuso')
      okamachi_ticket_checker = Kippu::TicketChecker.new(station: 'okamachi')

      expect(jyuso_ticket_checker.admit(ticket)).to be true
      expect(okamachi_ticket_checker.out(ticket)).to be true
    end
  end

  describe 'scenario 9' do
    example do 
      ticket = Kippu::Ticket.new(fare: 180)
      jyuso_ticket_checker = Kippu::TicketChecker.new(station: 'okamachi')
      okamachi_ticket_checker = Kippu::TicketChecker.new(station: 'jyuso')

      expect(jyuso_ticket_checker.admit(ticket)).to be true
      expect(okamachi_ticket_checker.out(ticket)).to be true
    end
  end
end
