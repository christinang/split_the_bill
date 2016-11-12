class User < ApplicationRecord
  # Direct associations

  has_many   :charges_paid,
             :class_name => "Charge",
             :foreign_key => "payer_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
