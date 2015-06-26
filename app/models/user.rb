class User < ActiveRecord::Base
  has_many :diaries

  enum job_type: {
    general:  100,
    designer: 200,
    engineer: 300
  }

  validates :full_name,  presence: true
  validates :nick_name,  presence: true
  validates :job_type,   presence: true
  validates :emp_number, presence: true, numericality: {greater_than: 0}
end
