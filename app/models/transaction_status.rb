class TransactionStatus < ApplicationRecord
  enum status: { failed: 0, successfull: 1 }
end
