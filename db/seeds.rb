# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |t|
    User.create! :username => "John Doe#{t}", :email => "john#{t}@gmail.com", :password => "topsecret#{t}", :password_confirmation => "topsecret#{t}", :admin => false, :activated => false, :cv => "cv.pdf"
end

50.times do |t|
    User.create! :email => "johnd#{t}@gmail.com", :password => "topsecret#{t}", :password_confirmation => "topsecret#{t}", :admin => false, :activated => false
end

2.times do |t|
    User.create! :username => "doctor user#{t}", :email => "doctor#{t}@gmail.com", :password => "topsecret", :password_confirmation => "topsecret", :admin => false, :activated => true, :cv => "cv.pdf"
end

User.create! :username => 'Patient0',:isPatient => true, :email => 'patient0@patient0.patient0', :password => 'patient0', :password_confirmation => 'patient0'
User.create! :username => 'John Doe', :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :admin => true, :activated => true
