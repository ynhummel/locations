class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :tradingName
      t.string :ownerName
      t.string :document
      t.json :coverageArea
      t.json :address

      t.timestamps
    end
  end
end
