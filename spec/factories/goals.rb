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

FactoryBot.define do
  factory :goal do
    
  end
end
