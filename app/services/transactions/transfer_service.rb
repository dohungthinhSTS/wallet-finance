module Transactions
  class TransferService < BaseService
    attr_reader :transfer_params

    def initialize(transfer_params:)
      @transfer_params = transfer_params
    end

    def execute
      ActiveRecord::Base.transaction do
        receiver_form = Transactions::FromTransferForm.new(from_form_attributes)
        destination_form = Transactions::ToTransferForm.new(to_form_attributes)
        result = receiver_form.submit && destination_form.submit
        [nil, result]
      rescue ActiveModel::ValidationError
        msg = "#{receiver_form.errors.full_messages.to_sentence}\n#{destination_form.errors.full_messages.to_sentence}"
        [msg, false]
      end
    end

    private

    def from_form_attributes
      @from_form_attributes ||= begin
        {
          wallet_id: transfer_params[:wallet_id],
          counterpart_id: transfer_params[:counterpart_id],
          amount: - transfer_params[:amount].to_i,
          transaction_status_id: success_status.id,
          transaction_type_id: transfer_type.id
        }
      end
    end

    def to_form_attributes
      @to_form_attributes ||= begin
        {
          wallet_id: transfer_params[:counterpart_id],
          counterpart_id: transfer_params[:wallet_id],
          amount: transfer_params[:amount].to_i,
          transaction_status_id: success_status.id,
          transaction_type_id: transfer_type.id
        }
      end
    end

    def success_status
      @success_status ||= TransactionStatus.find_by(status: TransactionStatus.statuses[:successfull])
    end

    def transfer_type
      @transfer_type ||= begin
        TransactionType.find_by(transaction_type: TransactionType.transaction_types[:transfer])
      end
    end
  end
end
