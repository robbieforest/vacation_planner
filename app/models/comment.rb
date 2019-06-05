class Comment < ApplicationRecord
  # Direct associations

  belongs_to :detail,
             :class_name => "TripDetail"

  belongs_to :user

  # Indirect associations

  # Validations

end
