class AddColumnsToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :curp, :string
  end
end
