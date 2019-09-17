class CreateJokes < ActiveRecord::Migration[6.0]
  def change
    create_table :jokes, id: :uuid do |t|
      t.text :body
      t.string :api_url
      t.string :api_id

      t.timestamps
    end

    add_index(:jokes, :api_id)
  end
end
