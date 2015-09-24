class CreatePandits < ActiveRecord::Migration
  def change
    create_table :pandits do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.timestamps null: false
    end
  end
end
