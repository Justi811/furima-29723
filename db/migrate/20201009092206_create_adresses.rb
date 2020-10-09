class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.references :order         , null: false
      t.string     :postcode      , null: false
      t.integer    :prefecture_id , null: false
      t.string     :city          , null: false
      t.string     :adress        , null: false
      t.string     :building 
      t.string     :phone         , null: false
      t.timestamps
    end
  end
end
