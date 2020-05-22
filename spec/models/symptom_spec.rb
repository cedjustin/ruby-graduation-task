require 'rails_helper'

RSpec.describe Symptom, type: :model do

  it "should not pass if the title is not present" do
    user = User.create!(email: 'cedro265@gmail.com', username: 'cedrick justin',  password: '123456', password_confirmation: "123456")
    symptom = Symptom.new(content:'', user_id: user.id, main: true)
    expect(symptom).not_to be_valid
  end

  it "should not pass if the content is not present" do
    user = User.create!(email: 'cedro265@gmail.com', username: 'cedrick justin',  password: '123456', password_confirmation: "123456")
    symptom = Symptom.new(title:'title1', user_id:user.id, main: true)
    expect(symptom).not_to be_valid
  end

  it "should not pass if the user id is not present" do
    symptom = Symptom.new(title:'title1', content:'title1 is good', main: true)
    expect(symptom).not_to be_valid
  end

  it "should not pass if the user doesn't exist" do
    symptom = Symptom.new(title:'title1', content:'title1 is good', user_id: 1, main: true)
    expect(symptom).not_to be_valid
  end

  it "should pass if the everything is okay" do
    user = User.create!(email: 'cedro265@gmail.com', username: 'cedrick justin',  password: '123456', password_confirmation: "123456")
    symptom = Symptom.new(title:'title1', content:'title1 is good', user_id: user.id, main: true)
    expect(symptom).to be_valid
  end
  
end
