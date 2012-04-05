class Admin < ActiveRecord::Base
  attr_accessible :token, :password, :password_confirmation,:emp_id,:emp_name,:emp_emailid
  belongs_to :emp
  has_many :forms
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :token
  validates_uniqueness_of :token
  validates :token , :length =>{:is => 9}
  validates :password ,:length => {:minimum => 5}
  
  def self.authenticate(token, password)
    admin = find_by_token(token)
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
      admin
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
