class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name
      t.string :logo
      t.text :body

      t.timestamps
    end

    Product.create_translation_table! :name => :string, :body => :text
  end

  def down
    drop_table :products
    Product.drop_translation_table!
  end
end
