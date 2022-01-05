require 'rails_helper.rb'

RSpec.describe User, type: :model do
  before do
    @new_user = User.new(username: 'someuser', status: 'online')
  end

  it 'allows the creation of users' do
    expect(@new_user.save).to eq(true)
  end
end
