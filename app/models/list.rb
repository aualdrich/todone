class List < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :items
end
