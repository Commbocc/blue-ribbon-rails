class ChildFatalitiesController < ApplicationController
  before_action :set_child_fatality, only: [:show, :edit, :update, :destroy]
  before_action :needs_to_scan?

  # GET /child_fatalities
  # GET /child_fatalities.json
  def index
    @child_fatalities = ChildFatality.filter params
  end

  # GET /child_fatalities/1
  # GET /child_fatalities/1.json
  def show
  end

  # GET /child_fatalities/new
  def new
    @child_fatality = ChildFatality.new
  end

  # GET /child_fatalities/1/edit
  def edit
  end

  # POST /child_fatalities
  # POST /child_fatalities.json
  def create
    @child_fatality = ChildFatality.new(child_fatality_params)

    respond_to do |format|
      if @child_fatality.save
        format.html { redirect_to @child_fatality, notice: 'Child fatality was successfully created.' }
        format.json { render :show, status: :created, location: @child_fatality }
      else
        format.html { render :new }
        format.json { render json: @child_fatality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /child_fatalities/1
  # PATCH/PUT /child_fatalities/1.json
  def update
    respond_to do |format|
      if @child_fatality.update(child_fatality_params)
        format.html { redirect_to @child_fatality, notice: 'Child fatality was successfully updated.' }
        format.json { render :show, status: :ok, location: @child_fatality }
      else
        format.html { render :edit }
        format.json { render json: @child_fatality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /child_fatalities/1
  # DELETE /child_fatalities/1.json
  def destroy
    @child_fatality.destroy
    respond_to do |format|
      format.html { redirect_to child_fatalities_url, notice: 'Child fatality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child_fatality
      @child_fatality = ChildFatality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_fatality_params
      params.require(:child_fatality).permit(:dod, :gender, :age, :county, :priorChild, :priorVerChild, :priorTwelve, :priorFive, :priorFiveServices, :causal, :narrative)
    end

	 def needs_to_scan?
	 	ChildFatality.scan
	 end
end
