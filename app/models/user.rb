class User < ApplicationRecord
  acts_as_paranoid without_default_scope: true

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :posts, dependent: :destroy

  validates_presence_of :email, :avatar, :name
  validates :email, uniqueness: true
  validate :is_unique_from_all_entries, on: :create

  after_restore :update_deleted_at

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

 def active_for_authentication?
   super && !self.deleted?
 end

 def update_deleted_at
  self.update(deleted_at: nil)
 end
 
 def is_unique_from_all_entries
  test = User.with_deleted.find_by(email: email)
  if test.present?
    if test.deleted_at.nil?
      errors.add(:email, "is already used.") 
    else
      errors.add(:email, "is soft deleted.") 
    end
  end
end

end
