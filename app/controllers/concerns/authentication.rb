module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :authenticated?
  end

  class_methods do
    def requires_authentication
      before_action :require_authentication
    end

    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  private

  def authenticated?
    Current.session.present?
  end

  def require_authentication
    SimplyTheTenant.with_global_access do
      resume_session || request_authentication
    end
  end


  def resume_session
    if session = find_session_by_cookie
      set_current_session session
    end
  end

  def find_session_by_cookie
    if token = cookies.signed[:session_token]
      Session.find_by(token: token)
    end
  end


  def request_authentication
    session[:return_to_after_authenticating] = request.url
    redirect_to new_session_url
  end

  # TODO: Probably ensure this goes to the right place.
  def after_authentication_url
    session.delete(:return_to_after_authenticating) || root_url
  end


  def start_new_session_for(user)
    user.sessions.create!(user_agent: request.user_agent, ip_address: request.remote_ip).tap do |session|
      set_current_session session
    end
  end

  def set_current_session(session)
    Current.session = session
    cookies.signed.permanent[:session_token] = { value: session.token, httponly: true, same_site: :lax }
  end

  def terminate_session
    Current.session.destroy
    cookies.delete(:session_token)
  end
end
