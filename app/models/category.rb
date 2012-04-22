class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :questions, :dependent => :destroy

  validates_presence_of :name

  scope :sorted, order("name asc")
end
