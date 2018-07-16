class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :curp, format: { with: /\A[A-Z][AEIOUX][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][MH][A-Z][BCDFGHJKLMNÑPQRSTVWXYZ]{4}[0-9A-Z][0-9]\z/i, message: 'no es un formato de CURP válido' }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

