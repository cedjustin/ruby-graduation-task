require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "should not pass if the email is not present" do
    user = User.new(password: '123456', password_confirmation: "123456")
    expect(user).not_to be_valid
  end

  it "should not pass if the password is not present" do
    user = User.new(email: 'cedro265@gmail.com', password_confirmation: "123456")
    expect(user).not_to be_valid
  end

  it "should not pass if the password confirmation is not present" do
    user = User.new(email: 'cedro265@gmail.com', password: '12345')
    expect(user).not_to be_valid
  end

  it "should not pass if the password is not less than 6 characters" do
    user = User.new(email: 'cedro265@gmail.com', password: '1234', password_confirmation: "1234")
    expect(user).not_to be_valid
  end

  it "should not pass if the password is does not match the password confirmation" do
    user = User.new(email: 'cedro265@gmail.com', password: '123456', password_confirmation: "1234")
    expect(user).not_to be_valid
  end

end
