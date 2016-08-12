module ProjectsHelper
  def project_class(project)
    project == current_project ? 'success' : ''
  end
end
