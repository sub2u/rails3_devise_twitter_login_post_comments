class Comment < ActiveRecord::Base
  attr_accessible :article_id, :description, :user_id
  belongs_to :user
  belongs_to :article
end
