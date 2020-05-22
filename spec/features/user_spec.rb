require 'rails_helper'

RSpec.feature "Users", type: :feature do
  
  scenario "test the experience of a patient, test that the page wont show the list of doctors if the patient did not provide their names" do 
    user = User.create!(:username => 'Patient0',:isPatient => true, :email => 'patient0@patient0.patient0', :password => 'patient0', :password_confirmation => 'patient0')
    visit essential_patient_path(user.id)
    click_on "continue"
    expect(page).to have_content('One step before you continue, please state your full names and click continue')
  end

  scenario "test the experience of a patient, test that the page will show the list of doctors if the patient did provide their names" do 
    user = User.create!(:username => 'Patient0',:isPatient => true, :email => 'patient0@patient0.patient0', :password => 'patient0', :password_confirmation => 'patient0')
    visit essential_patient_path(user.id)
    fill_in "username", with: "cedrick justin"
    click_on "continue"
    expect(page).to have_content('There are no available doctors right now, please try again later.......')
  end

end
