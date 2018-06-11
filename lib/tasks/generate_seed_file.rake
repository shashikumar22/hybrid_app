desc "Generate Seed File"
task :generate_seed_file do
  i = 0	
  (0..49).each do
  	User.create(name: "abc", email: "abc@gmail.com", phone_no: "1234", city: "bangalore", role: "admin")
  end	
end