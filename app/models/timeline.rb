class Timeline
  include ActiveModel::Model
  attr_accessor :status, :time, :transaction, :project, :user
end
