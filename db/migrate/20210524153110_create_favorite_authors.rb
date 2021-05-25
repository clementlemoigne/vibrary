class CreateFavoriteAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_authors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :author, foreign_key: { to_table: "users" }

      t.timestamps
    end
  end
end
