class Form < ActiveRecord::Base
  belongs_to :admin
  validates_presence_of :leavetype
  validates_presence_of :from
  validates_presence_of :to	
  validates_presence_of :reason
  validates:reason , :length => { :maximum => 500 }
  
end
