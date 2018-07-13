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

class Goal < ApplicationRecord
  validates :goal, :user_id, :private, :completed, presence: true
  
  belongs_to :user
  has_many :comments
end
