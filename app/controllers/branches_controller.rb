class BranchesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new
    @branch = branch.new
    render json: {branch: @branch}, status: :ok 
  end

  def show
    begin
      @branch = branch.find(params[:id])
      render json: {branch:@branch}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found
    end
  end

  def create
    begin
      @branch = Branch.new(branch_params)
      if @branch.save
        render json: { branch: @branch}, status: :created 
      else
        render json: @branch.errors, status: :unprocessable_entity 
      end
    rescue ActiveRecord::InvalidForeignKey => e
      render json: {error:'Invalid Foreign Key'}, status: :unprocessable_entity 		
    end
  end

  def destroy
    begin
      @branch = Branch.find(params[:id])
      @branch.destroy
      render json: {}, status: :ok  
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end

  def index
    @branchs = Branch.all
    render json: {branchs:@branchs}, status: :ok 
  end

  def edit
    begin
      @branch = Branch.find(params[:id])
      render json: {branch:@branch}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found 
    end
  end

  def update
    begin
      @branch = Branch.find(params[:id])
      if @branch.update(branch_params)
        render json: {branch:@branch}, status: :ok 
      else
        render json: @branch.errors, status: :unprocessable_entity 
      end
    rescue => e
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end
	
  private
    def branch_params
      params.require(:branch).permit(:code, :address, :phone_no,:bank_id)
    end

end