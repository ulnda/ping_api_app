require 'spec_helper'

shared_examples 'access to system without authentication' do
	it { expect(response.status).to eq(401) }	
end