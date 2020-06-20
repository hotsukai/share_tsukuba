# frozen_string_literal: true

class FoldersController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy edit]
  def new; end

  def create
    @folder = current_user.folder.build(folder_params)
  end

  def edit; end

  def destroy; end

  def show; end

  def folder_params
    params.require(:folder).permit(:name, :description)
  end
end
