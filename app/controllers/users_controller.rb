class UsersController < ApplicationController
  def index
    @users= User.all #ユーザーも出るからユーザーの情報をすべて取る
  end

  def show
  end

  def edit
  end
end
