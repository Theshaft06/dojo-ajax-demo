class Todo < ActiveRecord::Base
  
  validates :item, presence: true
 
  before_create do
  	self.completed = false
  	true
  end

end
