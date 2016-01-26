class SearchesController < ApplicationController
  def new
  	  @search = Search.new
  end

  def create
  	@search = Search.create(search_params)
    File.write('tmp/structures/chk.mol', @search.molecule ) if @search.molecule.present?
  	redirect_to @search
  end

  def show
  	@search = Search.find(params[:id])
  end

  def edit
    @search = Search.find(params[:id])
  end

  def update
    @search = Search.find(params[:id])
     respond_to do |format|
      if @search.update(search_params)
        File.write('tmp/structures/chk.mol', @search.molecule ) if @search.molecule.present?
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def search_params
  	params.require(:search).permit(:keywords, :formula, :min_mass, :max_mass, :molecule, :cas_number)  	
  end
end
