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
  validates :emp_number, presence: true, numericality: {greater_than: 0}
  validates :password,   presence: true, length: {minimum: 8}

  def self.job_types_dict
    {
      general:  "総合職",
      designer: "デザイナー",
      engineer: "エンジニア"
    }
  end
end
