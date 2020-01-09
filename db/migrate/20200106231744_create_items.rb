class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false, default: ""
      t.text :content, null: false, default: ""
      t.references :user, foreign_key: true
      t.integer :stocks_count, default: 0
      t.timestamps
    end
  end
end
