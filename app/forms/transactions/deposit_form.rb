module Transactions
  class DepositForm < BaseTransactionForm
    validates :amount, numericality: { greater_than: 0 }
  end
end
