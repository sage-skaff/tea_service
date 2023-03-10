class CreateTea < ActiveRecord::Migration[6.1]
  def change
    create_table :teas do |t|
      t.string :title
      t.string :description
      t.integer :temperature
      t.integer :brew_time
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
