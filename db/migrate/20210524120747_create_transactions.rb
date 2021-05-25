class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :counterpart_id
      t.string :wallet_id
      t.integer :amount
      t.integer :transaction_status_id
      t.integer :transaction_type_id

      t.timestamps
    end

    add_index :transactions, :counterpart_id
    add_index :transactions, :wallet_id
    add_index :transactions, :transaction_status_id
    add_index :transactions, :transaction_type_id
  end
end
