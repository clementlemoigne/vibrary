class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.string :tags, array: true, default: []
      t.boolean :vibration_compatibility, default: false
      t.integer :intensity
      t.integer :reading_time

      t.references :author, foreign_key: { to_table: "users" }

      t.timestamps
    end
  end
end
