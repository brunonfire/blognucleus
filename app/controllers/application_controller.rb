class ApplicationController < ActionController::Base


    protected

    def current_user
        @current_user ||= user.find_by_email_and_id(session[:email], session[:uid])
    rescue
        false
    end

#==========================================================================================================================================
 # verifica se existe um usuario logado
    def require_user
        if current_user
            true
        else
            redirect_to login_admin_users_url, alert: "Voce não tem acesso a essa area."
            return false
        end
    end 
 

 #===========================================================================================================================================
 # verifica se o usuario logado é um admin
    def admin?
        if current_user.tipo == "admin"
            true 
        else
            redirect_to login_admin_users_url, alert: "Você não tem acesso a essa area."
            return false
        end
    end 
=======
  protected

  # Busca usuário com base na session
  def current_user
    @current_user ||= User.find_by_email_and_id(session[:email], session[:uid])
  rescue
    false
  end

  #=====================================================================================================================
  # Verifica se existe um usuario logado
  def require_user
    if current_user
      true
    else
      redirect_to login_admin_users_url, alert: "Você não tem acesso a essa area."
      return false
    end
  end

  #=====================================================================================================================
  # verifica se o usuario logado é um admin
  def admin?
    if current_user.tipo == "admin"
      true
    else
      redirect_to login_admin_users_url, alert: "Você não tem acesso a essa area."
      return false
    end
  end
>>>>>>> 94ea104030dc38fc7558ac1cd308e0cae0789e79


end

