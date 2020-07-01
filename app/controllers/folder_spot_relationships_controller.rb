# frozen_string_literal: true

class FolderSpotRelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def create
    @relationship = FolderSpotRelationship.create(relationship_params)
    @spot = Spot.find(params[:folder_spot_relationship][:spot_id])
    respond_to do |format|
      format.html { redirect_to @spot }
      format.js
    end
end

  def destroy
    @relationship = FolderSpotRelationship.find_by(folder_id: params[:folder_spot_relationship][:folder_id],
                                                   spot_id: params[:folder_spot_relationship][:spot_id])
    @folder = @relationship.folder
    @spot = @relationship.spot

    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to Folder.find_by[:fodler_id] }
      format.js
    end
end

  def correct_user
    @folder = Folder.find_by(id: params[:folder_spot_relationship][:folder_id])
    redirect_to root_url and return if @folder.user != current_user
  end

  def relationship_params
    params.require(:folder_spot_relationship).permit(:folder_id, :spot_id, :comment)
  end
end
