# frozen_string_literal: true

# rubocop:disable Rails/HasManyOrHasOneDependent
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  has_many :activities
  has_many :taxes, through: :activities
  has_many :organizations, -> { distinct }, through: :activities
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: {minimum: 6}, unless: :provider?
  validates :password_confirmation, presence: true, unless: :provider?

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || auth.info.nickname + '_' + auth.provider
    end
  end
end
# rubocop:enable Rails/HasManyOrHasOneDependent
