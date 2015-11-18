class Choice < ActiveRecord::Base

  belongs_to :user
  belongs_to :prompt
  has_many :answers

end
