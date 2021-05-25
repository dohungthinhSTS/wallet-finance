class Transaction < ApplicationRecord
  belongs_to :owner_wallet, class_name: 'Wallet', foreign_key: :wallet_id
  belongs_to :counterpart_wallet, class_name: 'Wallet', foreign_key: :counterpart_id, optional: true
  belongs_to :transaction_type
  belongs_to :transaction_status
end
