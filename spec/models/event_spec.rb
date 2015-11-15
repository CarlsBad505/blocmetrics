require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create!(name: "john snow", email: "johnsnow@gmail.com", password: "winteriscoming") }
  let(:registered_application) { RegisteredApplication.create!(name: "Braintree", user: user) }
  let(:events) { Event.create!(name: "user registrations", registered_application: registered_application) }
  
  it { should belong_to(:registered_application) }
end
