class Question < ActiveRecord::Base
  attr_accessible :title, :body, :category_id
  attr_readonly :user_id

  belongs_to :user
  belongs_to :category, :counter_cache => true
  has_many :comments

  validates_presence_of :title, :body, :user, :category

  scope :unanswered, where(:comments_count => 0)
  scope :recent, order("id desc")
  scope :feed, limit(10).order("id desc").includes(:category)

  define_index do
    indexes title
    indexes body
  end

  def viewed!
    increment!(:views_count)
  end
end
