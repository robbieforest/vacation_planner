class TripDetail < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :foreign_key => "detail_id",
             :dependent => :destroy

  belongs_to :trip

  # Indirect associations

  # Validations

end
