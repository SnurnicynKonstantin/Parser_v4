class User < ActiveRecord::Base
  extend FriendlyId

  has_and_belongs_to_many :courses
  has_many :identities
  has_many :providers

  acts_as_voter
  acts_as_voteable

  friendly_id :name

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :video, VideoUploader

  def self.find_for_oauth(auth)
    provider = Provider.find_by(uid: auth.uid)

    if provider
      User.find(provider.user_id)
    else
      user = User.where(email: auth.info.email).first

      if user
        user.providers.create(provider: auth.provider, uid: auth.uid)
      else
        #self.mail = auth.info.email.nil? ? auth.uid + '@mail.ru' : auth.info.email
        @there_is_provider = false
        user = User.new(
                 name: auth.extra.raw_info.name
               )
        @there_is_provider = true
        if user.save
          user.providers.create(provider: auth.provider, uid: auth.uid)
        end
      user
      end
    end
  end

  def password_required?
    @there_is_provider != true
  end

  def email_required?
    @there_is_provider != true
  end

  def set_success(format, opts)
    self.success = true
  end

  searchable do
    text :name
    text :email
    time :created_at
  end

end
