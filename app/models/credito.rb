class Credito < ApplicationRecord
	self.primary_key = 'clave_credito'
	belongs_to :demanda
	has_many :mensualidad, 
    :foreign_key => 'credito_clave'
	self.table_name = "credito"

end
