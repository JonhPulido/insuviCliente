class Mensualidad < ApplicationRecord
	self.primary_key = 'clave_mensualidad'
	self.table_name = "mensualidad"
	belongs_to :credito
	has_many :abonocredito, :foreign_key => 'mensualidad_clave'
	

end
