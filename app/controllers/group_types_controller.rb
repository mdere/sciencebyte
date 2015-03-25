class GroupTypesController < ApplicationController
  before_action :set_group_type, only: [:show, :edit, :update, :destroy]

  # GET /group_types
  # GET /group_types.json
  def index
    @group_types = GroupType.all
  end

  # GET /group_types/1
  # GET /group_types/1.json
  def show
  end

  # GET /group_types/new
  def new
    @group_type = GroupType.new
  end

  # GET /group_types/1/edit
  def edit
  end

  # POST /group_types
  # POST /group_types.json
  def create
    @group_type = GroupType.new(group_type_params)

    respond_to do |format|
      if @group_type.save
        format.html { redirect_to @group_type, notice: 'Group type was successfully created.' }
        format.json { render :show, status: :created, location: @group_type }
      else
        format.html { render :new }
        format.json { render json: @group_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_types/1
  # PATCH/PUT /group_types/1.json
  def update
    respond_to do |format|
      if @group_type.update(group_type_params)
        format.html { redirect_to @group_type, notice: 'Group type was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_type }
      else
        format.html { render :edit }
        format.json { render json: @group_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_types/1
  # DELETE /group_types/1.json
  def destroy
    @group_type.destroy
    respond_to do |format|
      format.html { redirect_to group_types_url, notice: 'Group type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_type
      @group_type = GroupType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_type_params
      params.require(:group_type).permit(:desc)
    end
end
