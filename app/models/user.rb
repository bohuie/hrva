class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessor :login
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :admin, :active, :first_name, :last_name, :phone,
                  :address, :country, :province, :city, :organization, :current_role
  
  has_many :questionnaires

  validates_presence_of :username, :email, :first_name, :last_name, :organization, :current_role, :country, :province, :city, :phone
  validates_uniqueness_of :username
  
  before_create :set_active
  
  def display_name
    full_name = "#{first_name} #{last_name}".strip
    full_name = self.username if full_name.blank?    
    full_name += ", #{self.current_role}" if self.current_role.present?
    full_name
  end
  
protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["(lower(username) = :value OR lower(email) = :value) AND active = :active", { :value => login.downcase , :active => true}]).first
  end
  
  def set_active
    self.active = true
  end
    
end
