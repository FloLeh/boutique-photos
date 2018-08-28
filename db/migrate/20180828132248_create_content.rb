class CreateContent < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
    t. belongs_to :carts, index: true
    t.belongs_to :items, index: true
    end
  end
end
