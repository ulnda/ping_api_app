require 'spec_helper'

shared_examples 'attempt to create a new message with invalid params' do
	it { expect(response.status).to eq(400) }
	it { expect(Message.all.size).to eq(0) }
end