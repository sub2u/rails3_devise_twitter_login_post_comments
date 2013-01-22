class User < ActiveRecord::Base

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :name, :email, :password
has_many :authentications
has_many :articles
has_many :comments
  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    data.email='fake'+access_token.uid+'@test.com' if data.email.blank?
    if user = self.find_by_email(data.email)
      new_reg = false
      return user, new_reg
    else # Create a user with a stub password.
      user = self.new(:name => data.screen_name, :email => data.email, :password => Devise.friendly_token[0,20])
      user.save
      new_reg = true
      return user, new_reg
    end
  end

end
