class CreateJoinTableCategoriesJokes < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_jokes do |t|
      t.uuid :joke_id
      t.uuid :category_id

      t.index [:joke_id, :category_id]
      t.index [:category_id, :joke_id]
    end
  end
end
