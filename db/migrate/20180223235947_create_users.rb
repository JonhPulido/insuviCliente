class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.string :nombressfs
      t.string :password
      t.string :curp

      t.timestamps
    end
  end
end
