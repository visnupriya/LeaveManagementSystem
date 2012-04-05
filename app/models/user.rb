class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :validatable,:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :companyname ,:hrname,:email, :password, :password_confirmation, :remember_me 
  has_many :depts
  has_many :invitations, :class_name=>'Invitation', :foreign_key => 'sender_id'
  validates_presence_of :companyname
  validates_presence_of :hrname
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email
  validates_confirmation_of :password
end
