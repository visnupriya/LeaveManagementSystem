class Dept < ActiveRecord::Base
belongs_to :user
has_many :emps ,:dependent => :destroy
end
