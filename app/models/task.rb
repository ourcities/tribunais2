class Task < ActiveRecord::Base
  validates :mailchimp_list_uid, :position, :name, :mission, presence: true
  validates :position, :slug, uniqueness: true

  has_many :task_accomplishments
  has_many :users, through: :task_accomplishment
  acts_as_list
end
