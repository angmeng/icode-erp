class UserMailer < ActionMailer::Base
  default :from => "jc_lin7@hotmail.com"

  def welcome_email(qr_id, user_from, user_to, user_subject, user_message, email)
    @user_from = user_from
    @user_to = user_to
    @user_subject = user_subject
    @user_message = user_message
    @quotation_request_form = qr_id
    att = "QR NO##{qr_id.quotation_request_no}.pdf"
    attachments[att] = email
    mail(:to => @user_to, :subject => @user_subject)
  end
end
