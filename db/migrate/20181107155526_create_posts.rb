class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :complete
      t.integer :person
      t.string :location
      t.string :welfare
      t.string :start_date
      t.string :end_data
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
