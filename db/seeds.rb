# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |t|
    User.create! :username => "John Doe#{t}", :email => "john#{t}@gmail.com", :password => "topsecret#{t}", :password_confirmation => "topsecret#{t}", :admin => false, :activated => false, :cv => "Invoice_2019-9_-_Cedrick_Justin_-_588.80_USD.pdf"
end

50.times do |t|
    User.create! :email => "johnd#{t}@gmail.com", :password => "topsecret#{t}", :password_confirmation => "topsecret#{t}", :admin => false, :activated => false
end
User.create! :username => 'John Doe', :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :admin => true, :activated => true
