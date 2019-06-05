class Trip < ApplicationRecord
  # Direct associations

  has_many   :trip_details,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
