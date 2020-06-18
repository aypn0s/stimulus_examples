class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :price, default: 0
      t.boolean :visible, default: false
      t.integer :final_price, default: 0
      t.string :title

      t.timestamps
    end
  end
end
