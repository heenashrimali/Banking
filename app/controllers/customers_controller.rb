class Customertroller < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @customer = Customer.new
    render json: {user: @customer}, status: :ok 
  end

  def show
    begin
      @customer = Customer.find(params[:id])
      render json: {customer:@customer}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found			
    end
  end

  def create
    begin
      @customer = Customer.new(customer_params)
      if @customer.save
        render json: { customer: @customer}, status: :created 
      else
        render json: @customer.errors, status: :unprocessable_entity 
      end
    rescue ActiveRecord::InvalidForeignKey => e
      render json: {error:'Invalid Foreign Key'}, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @customer = Customer.find(params[:id])
      @customer.destroy
      render json: {}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end

  def index
    @customers = Customer.all
    render json: {customers:@customers}, status: :ok 
  end

  def edit
    begin
      @customer = Customer.find(params[:id])
      render json: {customer:@customer}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found 
    end
  end

  def update
    begin
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        render json: {customer:@customer}, status: :ok 
      else
        render json: @customer.errors, status: :unprocessable_entity 
      end
    rescue => e
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :address, :marital_status, :age, :date_of_birth, :contact_no, :branch_id)
    end

end