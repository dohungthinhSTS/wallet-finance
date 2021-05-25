class TransactionsController < ApplicationController
  before_action :load_sources, only: %i[new_deposit new_withdraw new_transfer accounts]
  def index
    @transactions = Transaction.all
  end

  def accounts; end

  def new_deposit; end

  def new_withdraw; end

  def new_transfer; end

  def deposit
    form, result = Transactions::DepositService.execute(deposit_params: deposit_withdraw_params)
    if result
      flash[:success] = 'Deposit successfully.'
      redirect_to transactions_path
    else
      @notice = form.errors.full_messages
      load_sources
      render :new_deposit
    end
  end

  def withdraw
    form, result = Transactions::WithdrawService.execute(withdraw_params: deposit_withdraw_params)
    if result
      flash[:success] = 'Withdraw successfully.'
      redirect_to transactions_path
    else
      @notice = form.errors.full_messages
      load_sources
      render :new_withdraw
    end
  end

  def transfer
    full_messages, result = Transactions::TransferService.execute(transfer_params: transfer_params)
    if result
      flash[:success] = 'Withdraw successfully.'
      redirect_to transactions_path
    else
      @notice = full_messages
      load_sources
      render :new_transfer
    end
  end

  private

  def load_sources
    @sources = [User.all.includes(:wallet), Team.all.includes(:wallet), Stock.all.includes(:wallet)].flatten
  end

  def deposit_withdraw_params
    params.fetch(:transaction, {}).permit(:wallet_id, :amount)
  end

  def transfer_params
    params.fetch(:transaction, {}).permit(:wallet_id, :counterpart_id, :amount)
  end
end
