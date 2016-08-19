module ProjectsHelper
  def project_class(project)
    project == current_user.current_project ? 'success' : ''
  end
end
