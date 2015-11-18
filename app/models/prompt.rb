class Prompt < ActiveRecord::Base

  belongs_to :user
  has_many :choices
  has_many :answers

end
