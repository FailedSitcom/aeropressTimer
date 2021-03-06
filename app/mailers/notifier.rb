class Notifier < ActionMailer::Base

  default :from => "hello@coffeefilter.me"

  def password_reset(user)
    @user = user
    mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>",
         subject: "Reset Your Password")
  end

  def recipe(recipe, destination)
    @user = recipe.user
    @recipe = recipe
    mail(to: destination, subject: "#{@user.first_name} sent you a coffee recipe")
  end
end
