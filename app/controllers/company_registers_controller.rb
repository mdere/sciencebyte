class CompanyRegistersController < ApplicationController
  before_action :set_company_register, only: [:show, :edit, :update, :destroy]

  # GET /company_registers
  # GET /company_registers.json
  def index
    @company_registers = CompanyRegister.all
  end

  # GET /company_registers/1
  # GET /company_registers/1.json
  def show
  end

  # GET /company_registers/new
  def new
    @company_register = CompanyRegister.new
  end

  # GET /company_registers/1/edit
  def edit
  end

  # POST /company_registers
  # POST /company_registers.json
  def create
    @company_register = CompanyRegister.new(company_register_params)

    respond_to do |format|
      if @company_register.save
        format.html { redirect_to @company_register, notice: 'Company register was successfully created.' }
        format.json { render :show, status: :created, location: @company_register }
      else
        format.html { render :new }
        format.json { render json: @company_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_registers/1
  # PATCH/PUT /company_registers/1.json
  def update
    respond_to do |format|
      if @company_register.update(company_register_params)
        format.html { redirect_to @company_register, notice: 'Company register was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_register }
      else
        format.html { render :edit }
        format.json { render json: @company_register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_registers/1
  # DELETE /company_registers/1.json
  def destroy
    @company_register.destroy
    respond_to do |format|
      format.html { redirect_to company_registers_url, notice: 'Company register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_register
      @company_register = CompanyRegister.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_register_params
      params.require(:company_register).permit(:business_name, :address_number, :address_street, :city, :state, :zip, :contact_number, :account_handler_first, :account_handler_last, :password_hash, :member_since)
    end
end
