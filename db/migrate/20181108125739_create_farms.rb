class CreateFarms < ActiveRecord::Migration[5.0]
  def change
    create_table :farms do |t|
      t.string :name,         null: false, default:""
      t.string :farm_type,    null: false, default:""
      t.string :admin,        null: false, default:""
      t.string :location,     null: false, default:""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
