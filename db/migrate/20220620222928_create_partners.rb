class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :trading_name
      t.string :owner_name
      t.string :document
      t.json :coverage_area
      t.json :address

      t.timestamps
    end
  end
end
