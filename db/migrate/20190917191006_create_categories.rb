class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :value

      t.timestamps
    end
    add_index :categories, :value
  end
end
