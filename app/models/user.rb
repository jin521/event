# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  password               :string
#  email                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :occasions
  has_many :rsvps

  # Trying to find a user with a given provider and uid which matches the omniauth hash. If one isnt found, a new user will be created with the below attirbutes i.e. the nickname provided by twitter will be set to the username

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid).permit!).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

  # Set the attributes back on the model and display it on the sign up page. Creates a new user record based on the given sessions details.
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attribtues = params
        user.valid? #display any validation errors
      end
    else
      super # Will go back to normal devise behavour i.e. create a new user instance
    end
  end

  # This method ensure that a password isnt required when a user signs in through twitter
  def password_required
    super && provider.blank?
  end
end
