require 'rails_helper'

RSpec.describe UsersChannel, type: :channel do
  it 'sueccessfully subscribes' do
    subscribe
    expect(subscription).to be_confirmed
  end
end
