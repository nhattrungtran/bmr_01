class CompaniesController < ApplicationController
  before_action :load_company, only: [:update, :destroy]

  def index
    @companies = Company.all
    @company = Company.new
    @workspace = Workspace.new
    @workspaces = Workspace.all
  end

  def create
    @company = Company.new company_params
    if @company.save
      flash[:success] = t "view.company.add_company_success"
    else
      flash[:danger] = t "view.company.add_company_fail"
    end
    redirect_to :back
  end

  def update
    @company.update_attributes company_params
    respond_to do |format|
      format.json {
        render json: {
          company_name: @company.name,
          company_descript: @company.descript
        }
      }
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def company_params
    params.require(:company).permit( :name, :descript).merge owner_id: current_user.id
  end

  def load_company
    @company = Company.find_by id: params[:id]
    return if @company
    flash[:warning] = t "view.company.not_found_company"
    redirect_to root_path
  end
end
