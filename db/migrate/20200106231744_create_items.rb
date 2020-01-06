class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :content
      t.user :references

      t.timestamps
    end
  end
end
