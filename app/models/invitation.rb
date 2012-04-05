class Invitation < ActiveRecord::Base
  belongs_to :sender, :class_name => 'User'
  belongs_to :emp
  has_one :admin
  before_create :generate_token
  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)[8..16]
  end

end

