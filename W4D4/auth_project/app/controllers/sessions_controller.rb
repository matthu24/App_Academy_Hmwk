class SessionsController < Application Controller

  def destroy
    logout!
    redirect_to new_session_url
  end
end
