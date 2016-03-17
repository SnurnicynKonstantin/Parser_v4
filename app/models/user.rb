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

  # def self.find_for_oauth(auth, signed_in_resource=nil)
  #   provider = Provider.find_by(uid: auth.uid)
  #   user = User.find(provider.user_id) if provider
  #
  #   if user
  #     user
  #   else
  #     if auth.provider == 'twitter'
  #       registered_user = User.where(:email => auth.uid + "@twitter.com").first
  #     else
  #       registered_user = User.where(:email => auth.info.email).first
  #     end
  #
  #     if registered_user
  #
  #       registered_user.providers << create_provider(auth)
  #       registered_user
  #     else
  #       if auth.provider == 'twitter'
  #         user = User.create(name: auth.extra.raw_info.name,
  #                            email: auth.uid+"@twitter.com",
  #         )
  #       else
  #         user = User.create(name:auth.extra.raw_info.name,
  #                            email:auth.info.email,
  #         )
  #       end
  #
  #       user.providers << create_provider(auth)
  #
  #       if user.save
  #         user
  #       end
  #     end
  #   end
  # end

  def self.find_for_oauth(auth)
    provider = Provider.find_by(uid: auth.uid)

    if provider
      User.find(provider.user_id)
    else
      user = User.where(email: auth.info.email).first

      if user
        user.providers.create(provider: auth.provider, uid: auth.uid)
      else
        user = User.new(name: auth.extra.raw_info.name,
                           email: auth.info.email,
        )

        if user.save
          user.providers.create(provider: auth.provider, uid: auth.uid)
          user.providers.save
        end
        user
      end
    end
  end

  def password_required?
    false #(providers.empty? || !password.blank?) && super
  end

  def email_required?
    true #email && providers.empty?
  end

  private

    def create_provider(auth)
      Provider.new(provider: auth.provider, uid: auth.uid)
    end

end
#email_require

# def self.find_for_oauth(auth)
#   provider = Provider.find_by(uid: auth.uid)
#
#   if provider
#     User.find(provider.user_id)
#   else
#     user = User.where(email: auth.info.email).first
#
#     if user
#       user.providers.create(provider: auth.provider, uid: auth.uid)
#     else
#       user = User.create(name: auth.extra.raw_info.name,
#                          email: auth.info.email,
#       )
#       user.providers.create(provider: auth.provider, uid: auth.uid)
#
#       if user.save
#         user
#       end
#     end
#   end
# end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              