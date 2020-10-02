class ItemsController < ApplicationController
  before_action :redirect_to_index, except: [:index, :show]

  def index
  end

  def new
  end

  def create
  end

  def redirect_to_index
    redirect_to user_session_path unless user_sign_in?
  end
end
