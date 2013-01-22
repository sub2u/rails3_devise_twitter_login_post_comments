class Comment < ActiveRecord::Base
  attr_accessible :article_id, :description, :user_id
end
