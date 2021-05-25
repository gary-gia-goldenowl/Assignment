# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  provider               :string
#  uid                    :string
#  image                  :string
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  admin                  :boolean          default(FALSE)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_writer :login

  has_many :orders

  validate :validate_username

  # Skip confirm email
  def confirmation_required?
    false
  end

  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value',
                                    { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end

  def validate_username
    errors.add(:username, "field can't be blank ") if User.where(email: username).exists?
  end

  # #Facebook login
  def self.from_omniauth(auth)
    result = User.where(email: auth.info.email).first
    result || where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.name
      user.image = auth.info.image
      user.uid = auth.uid
      user.provider = auth.provider

      #  If you are using confirmable and the provider(s) you use validate emails
      user.skip_confirmation!
    end
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: %i[facebook]
end
