class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  easy_roles :roles

  has_many :locations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
