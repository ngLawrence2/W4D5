# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  comment    :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  goal_id    :integer
#

FactoryBot.define do
  factory :comment do
    
  end
end
