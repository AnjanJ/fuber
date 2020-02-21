# frozen_string_literal: true

class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cab, null: false, foreign_key: true
      t.string :status
      t.decimal :destination_lat
      t.decimal :destination_lng
      t.decimal :distance
      t.decimal :cost
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
