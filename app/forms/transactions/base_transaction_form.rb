module Transactions
  class BaseTransactionForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :wallet_id, :string
    attribute :counterpart_id, :string
    attribute :amount, :integer
    attribute :transaction_status_id, :integer
    attribute :transaction_type_id, :integer

    validates :wallet_id, presence: true

    def submit
      return unless validate!

      Transaction.create!(attributes)
      true
    end

    def persisted?
      false
    end
  end
end
