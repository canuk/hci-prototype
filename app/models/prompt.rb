class Prompt < ActiveRecord::Base

  belongs_to :user
  has_many :choices
  has_many :answers
  accepts_nested_attributes_for :choices, allow_destroy: true

end
