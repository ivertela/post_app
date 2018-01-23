class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  acts_as_paranoid without_default_scope: true

  validates :name, presence: true
 
  validates :email, presence: true, uniqueness: { paranoia: :without_deleted }
  validate :email_is_unique
 
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]




  def email_is_unique
    unless User.where(email: self.email).count == 0
      errors.add(:email, 'Email name is taken')
    end
  end

end
