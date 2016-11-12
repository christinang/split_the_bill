class Event < ApplicationRecord
  # Direct associations

  has_many   :charges,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
