class CreatePapers < ActiveRecord::Migration[6.0]
  def change
    create_table :papers do |t|
      t.string :paper_name
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
