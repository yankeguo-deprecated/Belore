class AttachmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @attachment = Attachment.new
    @attachments = Attachment.all.order("id DESC").paginate(page: params[:page])
  end

  def create
    Attachment.create(params.require(:attachment).permit(:store))
    redirect_to attachments_path
  end
end
