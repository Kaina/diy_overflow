class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  
  validates_presence_of :nickname, :provider
  validates_uniqueness_of :nickname, :uid

  def self.create_with_omniauth(auth)
  	create! do |user|
  	  user.uid = auth[:uid]
  	  user.nickname = auth[:info][:nickname]
  	  user.provider = auth[:provider]
  	  user.image = auth[:info][:image]
  	  user.token = auth[:credentials][:token]
  	  user.secret = auth[:credentials][:secret]
  	end
  end
end
