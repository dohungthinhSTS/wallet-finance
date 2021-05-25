class CreateTransactionTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_types do |t|
      t.integer :transaction_type
      t.text :description

      t.timestamps
    end
  end
end
