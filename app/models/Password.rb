class Password
	include Mongoid::Document
	#TODO: Remember that a hash may be in multiple leak filenames when fetching
	field :leakfilename, type: String
	field :hash, type: String
	field :hash_type, type: String
	field :cleartext, type: String
end
