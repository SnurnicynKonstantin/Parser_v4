class User < ActiveRecord::Base

  has_and_belongs_to_many :courses
  has_many :identities
  has_many :providers

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  mount_uploader :avatar, AvatarUploader

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    provider = Provider.find_by(uid: auth.uid)
    user = User.find(provider.user_id) if provider

    if user
      return user
    else
      if auth.provider == 'twitter'
        registered_user = User.where(:email => auth.uid + "@twitter.com").first
      else
        registered_user = User.where(:email => auth.info.email).first
      end

      if registered_user

        registered_user.providers << create_provider(auth)

        if registered_user
          return registered_user
        end
      else
        if auth.provider == 'twitter'
          user = User.create(name:auth.extra.raw_info.name,
                             email:auth.uid+"@twitter.com",
          )
        else
          user = User.create(name:auth.extra.raw_info.name,
                             email:auth.info.email,
          )
        end

        user.providers << create_provider(auth)

        if user
          return user
        end

      end
    end
  end

  private

    def self.create_provider(auth)
      provider = Provider.create(provider:auth.provider,
                                 uid:auth.uid,
      )
    end

end
