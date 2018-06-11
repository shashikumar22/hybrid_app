ActiveAdmin.register Post do
	menu false
	permit_params :title, :body, :user_id
	filter :enumerized, filters: [:contains]

	index do
		div do 
		  span "Download: "
		  a "CSV", href: "posts.csv"
		  span "Count: #{Post.all.count}"
		end
	  column "Title" do |post|
	    link_to "#{post.title} (id #{post.id})", admin_post_path(post)
	  end
	  column :body
	  column :enumerized
	end



end
