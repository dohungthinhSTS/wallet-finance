class Wallet < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  has_many :transactions, foreign_key: :wallet_id

  def current_balance
    transactions.sum(:amount)
  end
end
