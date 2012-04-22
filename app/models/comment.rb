class Comment < ActiveRecord::Base
  attr_accessible :body
  attr_readonly :user_id, :question_id

  belongs_to :user
  belongs_to :question, :counter_cache => true

  validates_presence_of :body, :user, :question
end
