module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = User.find(current_user_id)
    end

    protected


    def current_user_id
      session['user_id']
    end

    def session
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end
  end
end
