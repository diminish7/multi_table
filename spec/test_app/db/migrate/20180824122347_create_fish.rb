# frozen_string_literal: true

class CreateFish < ActiveRecord::Migration[5.2]
  def change
    create_table :fish do |t|
      t.boolean :freshwater, null: false, default: true
    end
  end
end
