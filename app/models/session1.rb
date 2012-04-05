class Session1 < ActiveRecord::Base
validates_presence_of :token
  validates_presence_of :password
end
