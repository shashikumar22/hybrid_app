
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.destroy_all
50.times do |index|
	user_name = Faker::Name.unique.name
	
  User.create(
  	name: user_name,
  	email: Faker::Internet.unique.safe_email(user_name), 
  	phone_no: Faker::PhoneNumber.cell_phone, 
  	city: Faker::Address.city,
    gender: Faker::Gender.binary_type
  )                      
end