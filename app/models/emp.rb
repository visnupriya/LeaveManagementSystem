class Emp < ActiveRecord::Base
belongs_to :dept
has_one :admin
has_one :invitation
has_many :forms
  validates_presence_of :name
  validates_presence_of :emailid
  validates_presence_of :dateofjoining
  validates_presence_of :position
end
