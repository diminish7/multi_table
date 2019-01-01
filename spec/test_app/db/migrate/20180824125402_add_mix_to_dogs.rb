# frozen_string_literal: true

class AddMixToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :mix, :boolean, null: false, default: true
  end
end
