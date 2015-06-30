class User < ActiveRecord::Base
  attr_accessor :remember_token

  has_many :diaries
  has_many :comments

  has_secure_password

  mount_uploader :icon, IconUploader

  enum job_type: {
    general:  100,
    designer: 200,
    engineer: 300
  }

  validates :full_name,  presence: true
  validates :nick_name,  presence: true
  validates :job_type,   presence: true
  validates :password,   presence: true, length: {minimum: 8}, allow_nil: true

  def authenticated?(type, token)
    digest = self.send("#{type}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest.is_password? token)
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(self.remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def self.job_types_dict
    {
      general:  "総合職",
      designer: "デザイナー",
      engineer: "エンジニア"
    }
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end
end
