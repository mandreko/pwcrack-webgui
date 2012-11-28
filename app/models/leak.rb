class Leak
  include Mongoid::Document
  include Mongoid::Paperclip
  
  field :original_filename
  field :source
  
  has_mongoid_attached_file :file,
                            :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                            :url => "/system/:attachment/:id/:style/:filename"

  validates :original_filename, :presence => true
  validates :source, :presence => true

  references_many :passwords  
  
  def load_data
    
    File.open(self.file.path).each do |line|
      pass = Password.parse(self.id, line)
      pass.save
     end
     
     self.file = nil
     self.save
    
  end
  # Always call load_data in the background
  handle_asynchronously :load_data

end
