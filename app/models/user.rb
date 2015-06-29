class User < ActiveRecord::Base
  has_many :diaries

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

  def self.job_types_dict
    {
      general:  "総合職",
      designer: "デザイナー",
      engineer: "エンジニア"
    }
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
