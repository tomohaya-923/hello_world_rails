class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    # binding.pry
    @users = User.all

    # render json: @users
  end

  def show

  end

  def create
    # インスタンスをmodelから作成する
    # @user = User.new(
    #   name: params[:name],
    #   account: params[:account],
    #   email: params[:email],
    # )
    # binding.pry
    @user = User.new(user_params)

    # インスタンスをDBに保存する
    @user.save!

    # jsonとして値を返す
    render :show
  end

  def update
    # 対象のレコードを探す


    # 探してきたレコードに対して変更を行う
    @user.update!(user_params)

    # jsonとして値を返す
    render :show
  end

  def destroy
    # 対象のレコードを探す


    # 探してきたレコードを削除する
    @user.destroy!

    # jsonとして値を返す
    render :show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # strong parameters
  def user_params
    params.require(:user).permit(:name, :account, :email)
  end
end
