class User < ApplicationRecord
	extend Enumerize
	enumerize :role, in: [:user, :admin], default: :user
end
