ActiveAdmin.register User do
	permit_params :name, :email, :phone_no, :city, :gender, {favorite_colors: []}
	filter :gender
	filter :has_matching_color, collection: User::VALID_COLORS, as: :select
	filter :has_any_matching_color, as: :check_boxes, collection: User::VALID_COLORS, multiple: true
  	
  form do |f|
  	f.inputs "User Details" do
  		f.input :name
  		f.input :email
  		f.input :phone_no
  		f.input :gender
  		# f.input :city
  		f.input :favorite_colors, as: :select, multiple: true,	 input_html: {style:'width:80%'}
  	end
  	f.actions	
  end

	index do
		count = 0
		if params["q"] && params["q"]["role_eq"]
			count = User.where(role: params["q"]["gender_eq"]).count
			href = "users.csv?q[role_eq]=#{params["q"]["gender_eq"]}"
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
	  column :gender
	  column :favorite_color do |user|
	  	user.favorite_colors.join(",")
	  end 
	end
end
