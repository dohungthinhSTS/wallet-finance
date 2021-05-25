module Transactions
  class FromTransferForm < BaseTransactionForm
    validates :amount, numericality: { less_than: 0 }
    validates :wallet_id, presence: true
    validates :counterpart_id, presence: true

    validate :wallet_exists
    validate :counterpart_exists
    validate :wallet_differ_countepart
    validate :enough_money

    private

    def wallet_exists
      errors.add(:wallet_id, :invalid) unless Wallet.find_by(hash_address: wallet_id)
    end

    def counterpart_exists
      errors.add(:counterpart_id, :invalid) unless Wallet.find_by(hash_address: counterpart_id)
    end

    def wallet_differ_countepart
      errors.add(:wallet_id, :invalid) if wallet_id == counterpart_id
    end

    def enough_money
      return if Wallet.find_by(hash_address: wallet_id).current_balance >= (- amount)

      errors.add(:amount, :invalid)
    end
  end
end
