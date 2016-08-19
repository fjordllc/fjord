module ProjectsHelper
  def project_class(project)
    project == current_user.current_project ? 'success' : ''
  end

  def project_time
    if current_user.current_transaction
      current_user.current_transaction.started_at.to_i
    end
  end
end
