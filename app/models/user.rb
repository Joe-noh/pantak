class User < ActiveRecord::Base
  validates :full_name,  presence: true
  validates :nick_name,  presence: true
  validates :job_type,   presence: true
  validates :emp_number, presence: true, numericality: {greater_than: 0}
end
