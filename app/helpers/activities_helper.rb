module ActivitiesHelper
  def activities_icon(activity)
    case activity.source_model
    when Note
      '<i class="fa fa-sticky-note-o"></i>'.html_safe
    end
  end

  def activities_edit_url(activity)
    case activity.source_model
    when Note
      edit_note_path(activity.source_model.id, return_to: root_url)
    when Transaction
      edit_transaction_path(activity.source_model.id, return_to: root_url)
    end
  end

  def activities_delete_url(activity)
    case activity.source_model
    when Note
      note_path(activity.source_model.id, return_to: root_url)
    when Transaction
      transaction_path(activity.source_model.id, return_to: root_url)
    end
  end
end
