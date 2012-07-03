class Password
  include Mongoid::Document
  #TODO: Remember that a hash may be in multiple leak filenames when fetching
  field :leak_id
  field :pwhash
  field :salt
  field :hash_type
  field :cleartext
  
  validates :pwhash, :leak_id, :presence => true

  referenced_in :leaks
  
  index(:leak_id, {:unique => false, :name => "leak_id_index"})
  index(:hash_type, {:unique => false, :name => "hash_type_index"})
  # Don't forget: rake db:mongoid:create_indexes
  
  def self.parse(leak_id, line)
    pattern = /^(?<pwhash>[a-zA-Z\d]*):?(?<salt>[a-zA-Z\d]*)?/
    match = pattern.match line.strip

    password = Password.new
    password.leak_id = leak_id
    password.pwhash = match[:pwhash]
    password.salt = match[:salt].empty? ? nil : match[:salt]
    password.hash_type = HashIdentifier.identify(match[:pwhash])
    password
  end
end
