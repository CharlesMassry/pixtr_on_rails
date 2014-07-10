class GroupMembershipsController < ApplicationController
  def create
    group = Group.find(params[:id])
    current_user.join(group)
    redirect_to group, notice: "You have successfully joined #{group.name}."
  end

  def destroy
    group = Group.find(params[:id])
    current_user.leave(group)
    redirect_to dashboard_path
  end
end
