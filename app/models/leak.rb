class Leak
  include Mongoid::Document
  include Mongoid::Paperclip
  
  field :original_filename
  field :source
  
  has_mongoid_attached_file :file

  validates :original_filename, :presence => true

  references_many :passwords  
  
  def load_data
    
    File.open(self.file.path).each do |line|
      
      pattern = /^(?<hash>[a-zA-Z\d]*):?(?<salt>[a-zA-Z\d]*)?/
      match = pattern.match line.strip
      
      pass = Password.new
      pass.leakfilename = self.original_filename
      pass.hash = match[:hash]
      pass.salt = match[:salt]
      pass.hash_type = "md5" # Calculate this somehow

      pass.save
     end
     
     self.file = nil
     self.save
    
  end
  # Always call load_data in the background
  handle_asynchronously :load_data
end
