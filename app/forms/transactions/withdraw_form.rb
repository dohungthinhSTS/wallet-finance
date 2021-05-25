module Transactions
  class WithdrawForm < BaseTransactionForm
    validates :amount, numericality: { less_than: 0 }
  end
end
