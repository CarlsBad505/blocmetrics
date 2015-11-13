class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  
  URL_REGEX = /(\S+\.(com|net|org|edu|gov)(\/\S+)?)/ # Double check this regex
  
  validates :name, presence: true, length: { minimum: 1 }
  validates :url, 
            presence: true, 
            length: { minimum: 8 }, 
            uniqueness: { case_sensitive: false },
            format: { with: URL_REGEX }
end
