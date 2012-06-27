class Leak
	include Mongoid::Document
	include Mongoid::Paperclip
	
	field :original_filename
	field :source
	
	has_mongoid_attached_file :file

	validates :original_filename, :presence => true

	references_many :passwords	
end
