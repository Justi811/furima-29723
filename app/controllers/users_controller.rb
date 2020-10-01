class UsersController < ApplicationController


private


def user_params
  params.require(:user).permit(:nickname, :name, :surname, :kana_name, :kana_surname, :birthday)
end

def sign_up_params
  params.require(:user).permit(:nickname, :name, :surname, :kana_name, :kana_surname, :birthday)
  
end
  end