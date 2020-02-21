# frozen_string_literal: true

class CreateCabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cabs do |t|
      t.string :color
      t.boolean :on_duty, null: false
      t.decimal :lat, null: false
      t.decimal :lng, null: false

      t.timestamps
    end
  end
end
