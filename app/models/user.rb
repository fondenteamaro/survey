class User < ActiveRecord::Base
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :username, :email, :password, :password_confirmation   , :role

  attr_accessor :password
  before_save :prepare_password

  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_username(login) || find_by_email(login)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end

  def self.init_user
    User.destroy_all
    User.create(:username=>"fleetmobility", :email=>"larcara+fleet@gmail.com", :password=>"hamal976", :role=>"amministratore")
    User.create(:username=>"avis", :email=>"larcara+avis@gmail.com", :password=>"antilia258", :role=>"operatore")
    User.create(:username=>"aniasa", :email=>"larcara+aniasa@gmail.com", :password=>"crater027", :role=>"operatore")
    User.create(:username=>"demontis", :email=>"larcara+demontis@gmail.com", :password=>"lepus438", :role=>"operatore")
    User.create(:username=>"europcar", :email=>"larcara+europcar@gmail.com", :password=>"puppis590", :role=>"operatore")
    User.create(:username=>"hertz", :email=>"larcara+hertz@gmail.com", :password=>"scutum977", :role=>"operatore")
    User.create(:username=>"maggiore", :email=>"larcara+maggiore@gmail.com", :password=>"aries889", :role=>"operatore")
    User.create(:username=>"sicilybycar", :email=>"larcara+sicilybycar@gmail.com", :password=>"bootes450", :role=>"operatore")
    User.create(:username=>"sixt", :email=>"larcara+sixt@gmail.com", :password=>"gemini331", :role=>"operatore")
    User.create(:username=>"thrifty", :email=>"larcara+thrifty@gmail.com", :password=>"lupus276", :role=>"operatore")
    User.create(:username=>"locauto", :email=>"larcara+locauto@gmail.com", :password=>"pyxis178", :role=>"operatore")
  end

public
  def is_admin?
    role==="amministratore"
  end
end
