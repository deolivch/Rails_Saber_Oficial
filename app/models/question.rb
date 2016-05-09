class Question < ActiveRecord::Base
  validates :level,     presence: true
  validates :question,  presence: true
  validates :answer,    presence: true
end
