# == Schema Information
#
# Table name: goals
#
#  id         :bigint(8)        not null, primary key
#  goal       :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  private    :boolean
#  completed  :boolean
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should validate_presence_of(:goal) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:private) }
  it { should validate_presence_of(:completed) }
  it { should have_many(:comments) }
  it { should belong_to(:user) }
end
