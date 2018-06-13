class User < ApplicationRecord
	extend Enumerize
	VALID_COLORS = %w{red blue black white yellow green orange}
	enumerize :gender, in: [:male, :female]
	enumerize :favorite_colors, in: VALID_COLORS, multiple: true
	validate :ensure_valid_gender, :ensure_valid_colors
  
	def ensure_valid_gender
		errors.add(:gender, "invalid gender") if gender.nil?
	end

	def ensure_valid_colors
		errors.add(:favorite_colors, "select colors") if favorite_colors.empty?
	end

	scope :has_matching_color, ->(*colors) do 
   	colors = colors.join(", ")
		where("favorite_colors @> '{#{colors}}'")
  end

  scope :has_any_matching_color_in, ->(*colors) do
  	colors = colors.join(", ")
		where("favorite_colors && '{#{colors}}'")
  end	

  def self.ransackable_scopes option
		[
			:has_matching_color,
			:has_any_matching_color_in
		]
  end

end
