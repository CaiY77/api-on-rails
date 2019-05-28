class QuotesController < ApplicationController

  def index
    @quotes= Quote.all
    render json: @quotes, status: :ok
  end

  def show
    begin
      @quote = Quote.find(params[:id])
      render json: @quote, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: {
        message: "No quote matches that Id"
      },
      status: :not_found
    rescue ExceptionName
      render json:{
        message: "Something Broke"
      },
      status: :internal_server_error
    end
  end

end
