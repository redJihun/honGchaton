class ServesController < ApplicationController
  before_action :set_serf, only: [:show, :edit, :update, :destroy]

  # GET /serves
  # GET /serves.json
  def index
    @serves = Serve.all
  end

  # GET /serves/1
  # GET /serves/1.json
  def show
  end

  # GET /serves/new
  def new
    @serf = Serve.new
  end

  # GET /serves/1/edit
  def edit
    authorize_action_for @serf
  end

  # POST /serves
  # POST /serves.json
  def create
    @serf = Serve.new(serf_params)

    respond_to do |format|
      if @serf.save
        format.html { redirect_to @serf, notice: 'Serve was successfully created.' }
        format.json { render :show, status: :created, location: @serf }
      else
        format.html { render :new }
        format.json { render json: @serf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /serves/1
  # PATCH/PUT /serves/1.json
  def update
    authorize_action_for @serf
    respond_to do |format|
      if @serf.update(serf_params)
        format.html { redirect_to @serf, notice: 'Serve was successfully updated.' }
        format.json { render :show, status: :ok, location: @serf }
      else
        format.html { render :edit }
        format.json { render json: @serf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serves/1
  # DELETE /serves/1.json
  def destroy
    authorize_action_for @serf
    @serf.destroy
    respond_to do |format|
      format.html { redirect_to serves_url, notice: 'Serve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serf
      @serf = Serve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serf_params
      params.require(:serf).permit(:title, :content, :person, :start_date, :end_data, :location, :user_id, :complete)
    end
end
