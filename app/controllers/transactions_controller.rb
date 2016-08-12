class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    now = Time.current
    Transaction.transaction do
      finish_transactions(now)

      Transaction.create!(
        user:       current_user,
        project_id: params[:project_id],
        started_at: now,
        created_at: now,
        updated_at: now
      )
    end

    redirect_to projects_url, notice: '仕事を開始しました。'
  end

  def destroy
    finish_transactions(Time.current)
    redirect_to projects_url, notice: '仕事を終了しました。'
  end

  private
    def finish_transactions(time)
      current_user.transactions.active.update_all(
        finished_at: time,
        updated_at:  time
      )
    end
end
