# frozen_string_literal: true

class FolderSpotRelationshipsController < ApplicationController
  before_action :logged_in_user
  # before_action :correct_user

  def create
    FolderSpotRelationship.create(folder_id: params[:folder_id],
       spot_id: params[:spot_id], comment: params[:folder_spot_relationship][:comment])
    respond_to do |format|
      format.html { redirect_to Spot.find_by[:spot_id] }
      format.js
    end
end

  def destroy
    @relationship = FolderSpotRelationship.find_by(folder_id: params[:folder_id], spot_id: params[:spot_id])
    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to Folder.find_by[:fodler_id] }
      format.js
    end
end

  def correct_user
    @folder = current_user.folders.find_by(id: params[:folder_id])
    redirect_to root_url if @folder.nil?
    respond_to do |format|
      format.html { redirect_to Folder.find_by(id: params[:folder_id]) }
      format.js
    end
  end
end
