module ApplicationHelper
  def guest_signed_in?

    session[:guest] == true
  end
end
