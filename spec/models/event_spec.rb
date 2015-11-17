require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create!(name: "john snow", email: "johnsnow@gmail.com", password: "winteriscoming") }
  let(:registered_application) { RegisteredApplication.create!(name: "Braintree", url: "www.braintree.com", user: user) }
  let(:event) { Event.create!(name: "user registrations", registered_application: registered_application) }
  
  # Association Specs
  it { should belong_to(:registered_application) }
  
  describe "attributes" do
    it "should respond to name" do
      expect(event).to respond_to(:name)
    end
  end
end
