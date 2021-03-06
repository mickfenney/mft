class User < ActiveRecord::Base

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :phone, :url, :password, :password_confirmation, :remember_me

  validates_presence_of :name
  #validates_uniqueness_of :name

  validates :name, :length => { :maximum => 255 }
  validates :email, :length => { :maximum => 255 }
  validates :phone, :length => { :maximum => 255 }
  validates :url, :length => { :maximum => 255 }
  validates :password, :length => { :maximum => 255 }

  after_create :assign_default_role
  after_save :assign_default_role
  
  private

    def assign_default_role
      unless has_role? :admin
        add_role(:user)
      end
    end

end
