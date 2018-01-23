class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  acts_as_paranoid without_default_scope: true

  validates :name, presence: true

  validates :email, presence: true, uniqueness: { paranoia: :without_deleted }
  validate :email_is_unique, on: :create

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def email_is_unique
  	unless User.only_deleted.where(email: self.email).count == 0
  		errors.add(:email, 'Email name is taken')
  	end
  end

  def active_for_authentication?
    super && !self.deleted?
  end

end
