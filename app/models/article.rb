class Article < ActiveRecord::Base
  attr_accessible :description, :title, :user_id
   belongs_to :user
   has_many :comments
end
