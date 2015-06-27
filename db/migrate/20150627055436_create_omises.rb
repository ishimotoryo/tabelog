class CreateOmises < ActiveRecord::Migration
  def change
    create_table :omises do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :homepage

      t.timestamps null: false
    end
  end
end
