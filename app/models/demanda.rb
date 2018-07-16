class Demanda < ApplicationRecord
self.table_name = "demanda"
belongs_to :cliente
has_one :credito

end
