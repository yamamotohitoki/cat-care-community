class Public::MemberCommunitiesController < ApplicationController
  before_action :authenticate_member!
  def create
    member_community = current_member.member_communities.new(community_id: params[:community_id])
    member_community.save
    redirect_to request.referer
  end

  def destroy
    member_community = current_member.member_communities.find_by(community_id: params[:community_id])
    member_community.destroy
    redirect_to request.referer
  end
end
