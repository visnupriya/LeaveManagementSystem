class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invitation.subject
  #
  def invitation(emp,user)
    @greeting = "Hi"
    @url="http://guides.rubyonrails.org/action_mailer_basics.html"
    @emp=emp
 
    @user=user
    
    
    #body       :invitation => invitation, :signup_url => signup_url
    mail (:from=> @user,
          :to => @emp.emp_emailid,
          :subject =>'Welcome')
          
  end
end
