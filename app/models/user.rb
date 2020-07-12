# frozen_string_literal: true

class User < ApplicationRecord
  has_many :folders, dependent: :destroy # ユーザーがいなくなるとfoldersもなくなる。
  has_many :active_relationships, class_name: 'UserRelationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'UserRelationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed # followedsのことをfollowingと呼ぶように定義
  has_many :followers, through: :passive_relationships # followersのときはrailsが自動でpassive_Retatonshipsからfollower_idを探してくれる

  attr_accessor :remember_token # 変数定義的な感じ?
  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
    # BCrypt::Password.new(remember_digest)がremember_tokenをdigestしたものと同じか比較している？？
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def feed
    # Folder.where('user_id = ?', id)
    following_ids = "SELECT followed_id FROM user_relationships
                     WHERE follower_id = :user_id"
    Folder.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  def follow(other_user)
    following.append(other_user)
    # following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
