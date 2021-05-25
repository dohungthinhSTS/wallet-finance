class TransactionType < ApplicationRecord
  enum transaction_type: { deposit: 0, withdraw: 1, transfer: 2 }
end
