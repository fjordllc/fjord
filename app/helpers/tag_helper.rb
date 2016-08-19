module TagHelper
  def tag_status_icon(status = :start)
    tag = status == :start ? 'play' : 'stop'
    "<i class=\"fa fa-#{tag} status\"></i>".html_safe
  end
end
