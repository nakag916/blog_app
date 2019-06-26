module SessionsHelper

 #渡されたユーザーでログインする
 def log_in(user)
    session[:user_id] = user.id
 end

 def current_user?(user)
   user == current_user
 end
 
 #現在ログイン中のユーザを返す(いる場合)
 def current_user
    if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id]) 
    end
 end

 #ユーザがログインしていればtrue, その他ならfalseを返す
 def logged_in?
   !current_user.nil?
 end
end

def log_out
   session.delete(:user_id)
   @current_user = nil
end