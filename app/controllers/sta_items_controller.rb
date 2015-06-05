class StaItemsController < ApplicationController
  before_action :set_sta_item, only: [:show]

  # GET /sta_items
  # GET /sta_items.json
  def index
    @sta_items = StaItem.paginate(:page => params[:page], :per_page => 30)
  end

  # GET /sta_items/1
  # GET /sta_items/1.json
  def show
  end

  # GET /sta_items/new
  def new
    @sta_item = StaItem.new
  end

  # GET /sta_items/1/edit
  def edit
  end

  # POST /sta_items
  # POST /sta_items.json
  def create
    @sta_item = StaItem.new(sta_item_params)

    respond_to do |format|
      if @sta_item.save
        format.html { redirect_to @sta_item, notice: 'Sta item was successfully created.' }
        format.json { render :show, status: :created, location: @sta_item }
      else
        format.html { render :new }
        format.json { render json: @sta_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sta_items/1
  # PATCH/PUT /sta_items/1.json
  def update
    respond_to do |format|
      if @sta_item.update(sta_item_params)
        format.html { redirect_to @sta_item, notice: 'Sta item was successfully updated.' }
        format.json { render :show, status: :ok, location: @sta_item }
      else
        format.html { render :edit }
        format.json { render json: @sta_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sta_items/1
  # DELETE /sta_items/1.json
  def destroy
    @sta_item.destroy
    respond_to do |format|
      format.html { redirect_to sta_items_url, notice: 'Sta item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sta_item
      @sta_item = StaItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sta_item_params
      params.require(:sta_item).permit(:type, :by, :time, :text, :parent, :kids, :url, :score, :title, :parts, :descendants, :updated, :deleted, :dead)
    end
end
