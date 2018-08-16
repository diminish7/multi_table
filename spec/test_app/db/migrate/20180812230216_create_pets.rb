# frozen_string_literal: true

class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.multi_table
      t.timestamps
    end
  end
end
