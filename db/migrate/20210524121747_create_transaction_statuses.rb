class CreateTransactionStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_statuses do |t|
      t.integer :status
      t.text :description

      t.timestamps
    end
  end
end
