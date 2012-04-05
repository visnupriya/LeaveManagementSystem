class Mailer < ActionMailer::Base
  #default :from=> "visnupriya.be@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.invitation.subject
  #
  def deliver_invitation(invitation,user,signup)
    @greeting = "Hi"
    @url="http://guides.rubyonrails.org/action_mailer_basics.html"
    @invitation=invitation
    @user=user
    @signup_url=signup
    
    #body       :invitation => invitation, :signup_url => signup_url
    mail (:from=> @user,
          :to => @invitation.recipient_email,
          :subject =>'Welcome')
          
  end
  
end
