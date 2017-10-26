class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :title
      t.string :description
      t.datetime :deadline

      t.timestamps
    end
  end
end
