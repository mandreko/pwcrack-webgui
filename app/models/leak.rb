class Leak
	include Mongoid::Document
	
	field :filename
	field :source
	field :has_finished_uploading

	validates :filename, :presence => true

	references_many :passwords	
end
