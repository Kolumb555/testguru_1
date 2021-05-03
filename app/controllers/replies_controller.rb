class RepliesController < ApplicationController

  before_action :set_reply, only: %i[show]

  def show

  end

  private

  def set_reply
    @reply = Reply.find(params[:id])
  end

end
