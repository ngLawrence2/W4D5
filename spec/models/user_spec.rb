# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should have_many(:goals) }
  it { should have_many(:comments) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  describe '#is_password?' do 
    it 'validates password using BCrypt' do 
      
      user = User.new(username: 'user1', password: 'password')
      expect(user.is_password?('password')).to be true  
    end 
  end 
end
