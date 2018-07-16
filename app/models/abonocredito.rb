class Abonocredito < ApplicationRecord
	belongs_to :mensualuidad, :foreign_key => 'mensualidad_clave'
	self.table_name = "abono_credito"

end
