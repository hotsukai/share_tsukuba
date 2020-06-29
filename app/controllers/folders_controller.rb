# frozen_string_literal: true

class FoldersController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy edit]
  before_action :correct_user, only: %i[destroy update]

  def new; end

  def create
    @folder = current_user.folders.build(folder_params)
    if @folder.save
      flash[:success] = 'フォルダが作成されました!'
      redirect_to root_url
    else
      @feed_items = current_user.feed.page(page: params[:page])
      render 'static_pages/home'
    end
  end

  def edit
    @folder = Folder.find(params[:id])
  end

  def destroy
    @folder.destroy
    flash[:success] = 'フォルダが削除されました'
    redirect_to root_url
  end

  def update
    @folder.update(folder_params)
    flash[:success] = 'フォルダが更新されました'
    redirect_to @folder || root_url
  end

  def show
    @folder = Folder.find(params[:id])
  end

  def index; end

  def folder_params
    params.require(:folder).permit(:name, :description)
  end

  def correct_user
    @folder = current_user.folders.find_by(id: params[:id])
    redirect_to root_url if @folder.nil?
  end
end
