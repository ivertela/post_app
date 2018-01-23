class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  acts_as_paranoid without_default_scope: true

  validates :name, presence: true
 
  validates :email, presence: true, uniqueness: { paranoia: :without_deleted }
 
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
