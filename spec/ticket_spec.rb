require 'spec_helper'

describe Kippu::Ticket do 
  let(:ticket) { Kippu::Ticket.new(fare: fare) }

  describe 'fare' do
    let(:fare) { 150 }

    example do 
      expect(ticket.fare).to eq fare
    end
  end
end