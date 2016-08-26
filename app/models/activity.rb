class Activity
  include ActiveModel::Model
  attr_accessor :time, :description, :source_model, :project, :user, :sort_key, :status
end
