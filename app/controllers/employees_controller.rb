class EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @employee = Empolyee.new
    render json: {employee: @employee}, status: :ok 
  end

  def show
    begin
      @employee = employee.find(params[:id])
      render json: {employee:@employee}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found			
    end
  end

  def create
    begin
      @employee = Empolyee.new(employee_params)
      if @employee.save
        render json: { employee: @employee}, status: :created 
      else
        render json: @employee.errors, status: :unprocessable_entity 
      end
    rescue ActiveRecord::InvalidForeignKey => e
      render json: {error:'Invalid Foreign Key'}, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @employee = Empolyee.find(params[:id])
      @employee.destroy
      render json: {}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end

  def index
    @employees = Empolyee.all
    render json: {employees:@employees}, status: :ok 
  end

  def edit
    begin
      @employee = Empolyee.find(params[:id])
      render json: {employee:@employee}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found 
    end
  end

  def update
    begin
      @employee = Empolyee.find(params[:id])
      if @employee.update(employee_params)
        render json: {employee:@employee}, status: :ok 
      else
        render json: @employee.errors, status: :unprocessable_entity 
      end
    rescue => e
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :address,:designation, :date_of_joining, :age, :salary, :contact_no, :branch_id)
    end
 end