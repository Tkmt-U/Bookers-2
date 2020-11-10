class RelationshipsController < ApplicationController
  def create
    follew = current_user.follew_relationships.new(follew_id: params[:user_id])
    follew.save
    redirect_bock(fallback_location: root_path)
  end

  def destroy
    fallew = current_user.follew_relationships.find_by(follew_id: params[:user_id])
    follew.destroy
    redirect_bock(fallback_location: root_path)
  end
end
