class Notifier < ActionMailer::Base
<<<<<<< HEAD

=======
>>>>>>> c4f1582847aa778f88d0da0a7f66e578666aa6ca
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
