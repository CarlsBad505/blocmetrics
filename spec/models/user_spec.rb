require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "john snow", email: "johnsnow@gmail.com", password: "winteriscoming") }
  
  # Association specs
  it { should have_many(:registered_applications) }
  
  # Name Validation
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }
  
  # Email validations
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("example@blocmetrics.com").for(:email) }
  it { should_not allow_value("exampleblocmetrics.com").for(:email) }
  
  # Password validations
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(8) }
  
  describe "attributes" do
    it "should respond to name" do
      expect(user).to respond_to(:name)
    end
    
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
    
    it "should respond to password" do
      expect(user).to respond_to(:password)
    end
  end
end
