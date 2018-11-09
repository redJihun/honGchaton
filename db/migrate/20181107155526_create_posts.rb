class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :post_type # 1, 봉사자모집 2. 봉사 신청
      t.string :title
      t.string :content
      t.integer :complete, default: 0
      t.integer :person # 인풋태그 
      t.string :phone
      t.string :welfare
      t.string :start_date
      t.string :end_date
      t.string :location_one
      t.string :location_two
      t.string :phone
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
