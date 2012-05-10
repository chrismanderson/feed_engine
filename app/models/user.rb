class User < ActiveRecord::Base
  include StreamStore
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :display_name, :password, :password_confirmation, :remember_me

  validates :display_name, :presence => true
  validates :display_name, :format => { :with => /\A[a-zA-Z0-9_-]+\z/, 
            :message => "may only contain letters, numbers, dashes, and underscores." }  

  after_create :send_welcome_mail
  has_many :link_items
  has_many :image_items
  has_many :text_items

  private 

  def send_welcome_mail
    Resque.enqueue(WelcomeMailJob, self)
  end
end