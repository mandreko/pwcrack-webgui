class Password
	include Mongoid::Document
	#TODO: Remember that a hash may be in multiple leak filenames when fetching
	field :leakfilename
	field :hash
	field :hash_type
	field :cleartext
	
	validates :hash, :leakfilename, :presence => true

	referenced_in :leaks
end
