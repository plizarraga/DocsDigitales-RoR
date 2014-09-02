class User < ActiveRecord::Base

  attr_accessor :contrasena
  has_many :stores, dependent: :destroy  
  before_save :encrypt_password
 
  validates_presence_of :correo_electronico
  validates_uniqueness_of :correo_electronico

  validates_presence_of :nombre
  
  validates_presence_of :rfc
  validates_uniqueness_of :rfc

  validates_presence_of :empresa	
  validates_uniqueness_of :empresa
  
  validates_confirmation_of :contrasena
  validates_presence_of :contrasena, :on => :create
  
  def self.authenticate(email, password)
    user = find_by_correo_electronico(email)
    if user && user.contrasena_hash == BCrypt::Engine.hash_secret(password, user.contrasena_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if contrasena.present?
      self.contrasena_salt = BCrypt::Engine.generate_salt
      self.contrasena_hash = BCrypt::Engine.hash_secret(contrasena, contrasena_salt)
    end
  end
end
