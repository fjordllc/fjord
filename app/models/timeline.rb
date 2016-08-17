class Timeline
  include ActiveModel::Model
  attr_accessor :status, :time, :transaction, :project, :user

  def target_time
    status == '開始' ? transaction.started_at : transaction.finished_at
  end
end
