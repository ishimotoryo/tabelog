class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :body, null: false
      t.references :omise, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :reviews, [:omise_id, :user_id], unique: true
  end
end
