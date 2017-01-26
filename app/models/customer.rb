class Customer < ActiveRecord::Base
	before_save :set_keywords

	scope :search, -> (search) {where('keywords LIKE ?', "%#{search.downcase}%")}

	scope :ft_search, -> (search) {where("(to_tsvector('english', keywords) @@ to_tsquery(?))", search)}
	
	protected
	
	def set_keywords
		self.keywords = [first_name, last_name, email].map(&:downcase).join(' ')
	end
end
