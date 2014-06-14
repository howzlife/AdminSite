class AdminUser < ActiveRecord::Base
	has_many :tasks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  after_create { |admin| admin.send_reset_password_instructions }
  def password_require?
  	new_record? ? false : super
  end
end
