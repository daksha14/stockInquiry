class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.references :buyer, null: false, foreign_key: true
      t.references :paper, null: false, foreign_key: true

      t.timestamps
    end
  end
end
