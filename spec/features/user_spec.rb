require 'rails_helper'

RSpec.feature "Users", type: :feature do
  
  before do
    User.create!(:username => 'John Doe', :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :admin => true, :activated => true)
    User.create!(:username => 'Patient0',:isPatient => true, :email => 'patient0@patient0.patient0', :password => 'patient0', :password_confirmation => 'patient0')
  end

  scenario "test the experience of a patient, test that the page wont show the list of doctors if the patient did not provide their names" do 
    visit essential_patient_path(1)
    click_on "continue"
    expect(page).to have_content('One step before you continue, please state your full names and click continue')
  end

  scenario "test the experience of a user, test if login doesn't work if the password is wrong" do 
    visit user_session_path
    fill_in "user_email", with: "cedro265@gmail.com"
    fill_in "user_password", with: "1234"
    click_on "Log in"
    expect(page).to have_content('Invalid Email or password')
  end

  scenario "test the experience of a user, test if login does work" do 
    visit user_session_path
    fill_in "user_email", with: "john@gmail.com"
    fill_in "user_password", with: "topsecret"
    click_on "Log in"
    visit users_path
    expect(page).to have_content('Admin dashboard')
  end

  scenario "test the experience of a user, test if you can access dashboard when you are not logged in" do 
    visit users_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario "test the experience of a user, test if you can access admin dashboard when you are not logged in" do 
    visit admin_users_path
    expect(page).to have_content('you are not authorized to access this page')
  end

  scenario "test the experience of a user, test if you can access symptom page when you are not logged in" do 
    visit new_symptom_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

end
