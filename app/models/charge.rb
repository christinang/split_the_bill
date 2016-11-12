class Charge < ApplicationRecord
  # Direct associations

  belongs_to :payer,
             :class_name => "User"

  # Indirect associations

  # Validations

end
