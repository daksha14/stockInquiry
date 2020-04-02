class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :channel_id
      t.integer :sender_id
      t.string :sender_type

      t.timestamps
    end
  end
end
