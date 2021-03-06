class Vote < ActiveRecord::Base
  # class_name and foreign_key are necessary because "creator" deviates from the default of user
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :voteable, polymorphic: true

  # Same user can't create a vote for the same object
  validates_uniqueness_of :creator, scope: [:voteable_id, :voteable_type]
end