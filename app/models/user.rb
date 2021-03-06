class User < ApplicationRecord
  
  mount_uploader :cv, CvUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  paginates_per 5
  has_many :symptoms
  has_many :messages, dependent: :destroy
end
