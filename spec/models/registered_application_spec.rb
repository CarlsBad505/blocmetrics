require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:user) { User.create!(name: "john snow", email: "john.snow@gmail.com", password: "winteriscoming") }
  let(:registered_application) { RegisteredApplication.create!(name: "ice cream store", url: "http://www.icecreamshop.com", user: user) }
  
  # Association specs
  it { should belong_to(:user) }
  it { should have_many(:events) }
  
  # Name validations
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }
  
  # URL validations
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url) }
  it { should validate_length_of(:url).is_at_least(8) }
  
  describe "attributes" do
    it "should respond to name" do
      expect(registered_application).to respond_to(:name)
    end
    
    it "should respond to url" do
      expect(registered_application).to respond_to(:url)
    end
  end
end
