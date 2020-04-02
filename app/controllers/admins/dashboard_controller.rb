class Admins::DashboardController < ApplicationController
  require 'csv'
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @papers = Paper.order(:paper_id).page(params[:page])
  end

  def inquiry
    @paper = Paper.find_by(id: params[:paper_id])
    @channels = @paper.channels
  end

  def channel
    @channel = Channel.find_by(id: params[:channel_id])
  end

  def message
    @message = current_admin.messages.create(body: params[:message],channel_id:  params[:channel_id])
  end
 
  def import_csv
    file = params[:file]
    table = CSV.parse(File.read(file), headers: true,skip_blanks: true)
    table.delete_if { |row| row.to_hash.values.all?(&:blank?) }

    table.each do |row|
      record = Paper.find_by(paper_name: row['paper_name'])
      if record
        record.update(price: row['price'],quantity: row['quantity'])
      else
        Paper.create(paper_name: row['paper_name'],price: row['price'],quantity: row['quantity'])
      end
    end
    redirect_to admins_dashboard_index_path
    end
end
#route add 
#action in controller 
#action path in form url

