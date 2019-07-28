class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: %i[edit update show destroy]

  layout 'portfolios'

  access all: %i[show index], user: { except: %i[destroy new create update edit sort] }, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |_key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    head :ok
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show; end

  def destroy
    @portfolio_item.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Record was removed.' }
    end
  end

  private

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(
      :title,
      :subtitle,
      :body,
      :main_image,
      :thumb_image,
      technologies_attributes: [:id, :name, :_destroy]
    )
  end
end
