class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3 }
            
  
  # def self.avatar_url(user, size)
  #   gravatar_id = Digest::MD5::hexdigest(user.email).downcase
  #   "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  # end  
end
