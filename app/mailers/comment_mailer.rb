class CommentMailer < ApplicationMailer

  default from: "noreply@localhost"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.sendmail.subject
  #
  def sendmail(blog, entry, comment)
    @blog = blog
    @entry = entry
    @comment = comment

    mail from: "noreply@localhost",
    to: "root@localhost",
    subject: "新しいコメントが投稿されました"
  end
end
