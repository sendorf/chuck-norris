class CreateTableJokesSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :jokes_searches, id: :uuid do |t|
      t.uuid :joke_id
      t.uuid :search_id
    end
  end
end
