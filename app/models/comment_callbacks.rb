class CommentCallbacks
  def after_commit(comment)
    if comment.owner != comment.user
      CommentMailer.receive_comment(comment).deliver_later
    end
  end
end
