class CreateOffers < ActiveRecord::Migration[7.2]
  def change
    create_table :offers do |t|
      t.decimal :value
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
