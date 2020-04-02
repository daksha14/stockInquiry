class DashboardController < ApplicationController
  before_action :authenticate_buyer!

  def index
    @papers = Paper.order(:paper_id).page(params[:page])
  end

  def inquiry
   @channel = Channel.find_or_create_by(buyer_id: current_buyer.id ,paper_id: params[:paper_id])
  end

  def message
    @message = current_buyer.messages.create(body: params[:message],channel_id:  params[:channel_id])
    #redirect_to inquiry_dashboard_index_path(paper_id: @message.channel.paper.id)
  end
end
