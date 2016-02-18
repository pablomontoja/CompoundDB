class CompoundsController < ApplicationController
  before_action :set_compound, only: [:show, :edit, :update, :destroy]


  def getinfo
    File.write("tmp/structures/fileinfo.mol", params[:mol] )
    
    data = %x( obprop tmp/structures/fileinfo.mol ).split("\n")
    hash = Hash["#{data[1].split.itself[0]}": data[1].split.itself[1], 
         "#{data[2].split.itself[0]}": data[2].split.itself[1], 
         "#{data[3].split.itself[0]}": data[3].split.itself[1]]
    render :json => hash.to_json
  end

  # GET /compounds
  # GET /compounds.json
  def index
    @compounds = Compound.order(:molar_mass).paginate(page: params[:page], per_page: 20)
  end

  # GET /compounds/1
  # GET /compounds/1.json
  def show
  end

  # GET /compounds/new
  def new
    @compound = Compound.new
  end

  # GET /compounds/1/edit
  def edit
  end

  # POST /compounds
  # POST /compounds.json
  def create
    @compound = Compound.new(compound_params)
    respond_to do |format|
      if @compound.save
        @compound.update_attribute(:created_by, current_user.id)
        File.write("tmp/structures/#{@compound.id}.mol", @compound.structure )
        format.html { redirect_to @compound, notice: 'Compound was successfully created.' }
        format.json { render :show, status: :created, location: @compound }
      else
        format.html { render :new }
        format.json { render json: @compound.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compounds/1
  # PATCH/PUT /compounds/1.json
  def update
    respond_to do |format|
      if @compound.update(compound_params)
        @compound.update_attribute(:edited_by, current_user.id)
        File.write("tmp/structures/#{@compound.id}.mol", @compound.structure )
        format.html { redirect_to @compound, notice: 'Compound was successfully updated.' }
        format.json { render :show, status: :ok, location: @compound }
      else
        format.html { render :edit }
        format.json { render json: @compound.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compounds/1
  # DELETE /compounds/1.json
  def destroy
    @compound.destroy
    respond_to do |format|
      File.delete("tmp/structures/#{@compound.id}.mol") if File.exist?("tmp/structures/#{@compound.id}.mol")
      format.html { redirect_to compounds_url, notice: 'Compound was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compound
      @compound = Compound.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compound_params
      params.require(:compound).permit(:name, :molecular_formula, :molar_mass, :cas, :structure, :amount, :shelf, :room_number, :additional_info)
    end
end
