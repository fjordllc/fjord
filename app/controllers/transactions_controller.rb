class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_my_transaction, only: %i(edit update destroy)

  def edit
  end

  def update
    redirect_url = params[:return_to] || root_url

    if @transaction.update(transaction_params)
      redirect_to redirect_url, notice: 'タイムラインを編集しました。'
    else
      render :edit
    end
  end

  def destroy
    redirect_url = params[:return_to] || root_url
    @transaction.destroy
    redirect_to redirect_url, notice: 'タイムラインを削除しました。'
  end

  private
    def set_my_transaction
      @transaction = current_user.transactions.find(params[:id])
    end

    def transaction_params
      params.require(:transaction).permit(:started_at, :finished_at, :project_id)
    end
end
