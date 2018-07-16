class Cliente < ApplicationRecord
	self.table_name = "cliente"
	has_many :demandas

end
