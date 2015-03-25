class CompanyGroupsController < ApplicationController
  before_action :set_company_group, only: [:show, :edit, :update, :destroy]

  # GET /company_groups
  # GET /company_groups.json
  def index
    @company_groups = CompanyGroup.all
  end

  # GET /company_groups/1
  # GET /company_groups/1.json
  def show
  end

  # GET /company_groups/new
  def new
    @company_group = CompanyGroup.new
  end

  # GET /company_groups/1/edit
  def edit
  end

  # POST /company_groups
  # POST /company_groups.json
  def create
    @company_group = CompanyGroup.new(company_group_params)

    respond_to do |format|
      if @company_group.save
        format.html { redirect_to @company_group, notice: 'Company group was successfully created.' }
        format.json { render :show, status: :created, location: @company_group }
      else
        format.html { render :new }
        format.json { render json: @company_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_groups/1
  # PATCH/PUT /company_groups/1.json
  def update
    respond_to do |format|
      if @company_group.update(company_group_params)
        format.html { redirect_to @company_group, notice: 'Company group was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_group }
      else
        format.html { render :edit }
        format.json { render json: @company_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_groups/1
  # DELETE /company_groups/1.json
  def destroy
    @company_group.destroy
    respond_to do |format|
      format.html { redirect_to company_groups_url, notice: 'Company group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_group
      @company_group = CompanyGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_group_params
      params.require(:company_group).permit(:company_id, :group_id)
    end
end
