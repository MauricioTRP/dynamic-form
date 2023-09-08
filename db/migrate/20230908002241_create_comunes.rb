class CreateComunes < ActiveRecord::Migration[7.0]
  def change
    create_table :comunes do |t|
      t.string :name
      t.references :province, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
