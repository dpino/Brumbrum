class SpareyardsController < ApplicationController
  # GET /spareyards
  # GET /spareyards.json
  def index
    @spareyards = Spareyard.where('lower(province) = ?', params[:location].downcase).
        order("name").page(params[:page]).per(15)
    @total_spareyards = spareyards_in(params[:location])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spareyards }
    end
  end

  def spareyards_in(province)
    result = Spareyard.select('count(*) as count').where('province = ?', params[:location])
    return result.empty? ? 0 : result.count
  end

  # GET /spareyards/1
  # GET /spareyards/1.json
  def show
    @spareyard = Spareyard.find(params[:id])
    @map = @spareyard.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spareyard }
    end
  end

  # GET /spareyards/new
  # GET /spareyards/new.json
  def new
    @spareyard = Spareyard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spareyard }
    end
  end

  # GET /spareyards/1/edit
  def edit
    @spareyard = Spareyard.find(params[:id])
  end

  # POST /spareyards
  # POST /spareyards.json
  def create
    @spareyard = Spareyard.new(params[:spareyard])

    respond_to do |format|
      if @spareyard.save
        format.html { redirect_to @spareyard, notice: 'Spareyard was successfully created.' }
        format.json { render json: @spareyard, status: :created, location: @spareyard }
      else
        format.html { render action: "new" }
        format.json { render json: @spareyard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spareyards/1
  # PUT /spareyards/1.json
  def update
    @spareyard = Spareyard.find(params[:id])

    respond_to do |format|
      if @spareyard.update_attributes(params[:spareyard])
        format.html { redirect_to @spareyard, notice: 'Spareyard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spareyard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spareyards/1
  # DELETE /spareyards/1.json
  def destroy
    @spareyard = Spareyard.find(params[:id])
    @spareyard.destroy

    respond_to do |format|
      format.html { redirect_to spareyards_url }
      format.json { head :no_content }
    end
  end

end
