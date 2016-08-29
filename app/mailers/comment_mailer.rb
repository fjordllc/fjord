class CommentMailer < ApplicationMailer
  def receive_comment(comment)
		@comment = comment
		@owner   = comment.owner
    @user    = comment.user
    mail to: @owner.email,
         subject: '[fjord.cm]コメントが投稿されました'
  end
end
