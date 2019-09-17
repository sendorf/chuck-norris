class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches, id: :uuid do |t|
      t.string :query

      t.timestamps
    end
    add_index :searches, :query
  end
end
