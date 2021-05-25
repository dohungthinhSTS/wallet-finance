class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets, { id: false } do |t|
      t.string :hash_address, primary_key: true
      t.integer :attachable_id
      t.string :attachable_type

      t.timestamps
    end
    add_index :wallets, [:attachable_type, :attachable_id]
  end
end
