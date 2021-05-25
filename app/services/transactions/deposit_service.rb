module Transactions
  class DepositService < BaseService
    attr_reader :deposit_params

    def initialize(deposit_params:)
      @deposit_params = deposit_params
    end

    def execute
      form = Transactions::DepositForm.new(deposit_form_attributes)
      [form, form.submit]
    end

    private

    def deposit_form_attributes
      success_status = TransactionStatus.find_by(status: TransactionStatus.statuses[:successfull])
      deposit_type = TransactionType.find_by(transaction_type: TransactionType.transaction_types[:deposit])
      deposit_params.merge(transaction_status_id: success_status.id, transaction_type_id: deposit_type.id)
    end
  end
end
