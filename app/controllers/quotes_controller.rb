class QuotesController < ApplicationController
    before_action :set_quote, only: [:show, :edit, :update, :destroy]

    def index
      @quotes = Quote.all
    end
  
    def show
    end
  
    def new
      @quote = Quote.new
    end
  
    def create
      @quote = Quote.new(quote_params)
  
      if @quote.save
        redirect_to quotes_path, notice: "見積もりを作成しました"
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @quote.update(quote_params)
        redirect_to quotes_path, notice: "見積もりを更新しました"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @quote.destroy
      redirect_to quotes_path, notice: "見積もりを削除しました"
    end
  
    private
  
    def set_quote
      @quote = Quote.find(params[:id])
    end
  
    def quote_params
      params.require(:quote).permit(:name)
    end
end
