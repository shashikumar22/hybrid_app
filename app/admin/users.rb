ActiveAdmin.register User do
	permit_params :name, :email, :phone_no, :city, :role
	filter :role
	# filter :role_contains

	index do
		count = 0
		if params["q"] && params["q"]["role_eq"]
			count = User.where(role: params["q"]["role_eq"]).count
			href = "users.csv?q[role_eq]=#{params["q"]["role_eq"]}"
		else
			count = User.all.count
			href = "users.csv"
		end    
		div do 
		  span "Download: "
		  a "CSV", href: href
		  # byebug
		  span "#{count} matching users"
		end
	  column "Name" do |user|
	    link_to "#{user.name} (id #{user.id})", admin_user_path(user)
	  end
	  column :email
	  column :phone_no
	  column :city
	  column :country
	  column :role
	end
end
