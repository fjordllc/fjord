class Subdomain::CompaniesController < Subdomain::BaseController
  before_action :set_our_company, only: %i(show edit update destroy)
  before_action :set_our_companies, only: %i(index)

  def index
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    @company.team = our_team

    redirect_url = params[:return_to] || companies_url

    if @company.save
      redirect_to redirect_url, notice: '企業を投稿しました。'
    else
      render :new
    end
  end

  def update
    redirect_url = params[:return_to] || companies_url

    if @company.update(company_params)
      redirect_to redirect_url, notice: '企業を編集しました。'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, notice: '企業を削除しました。'
  end

  private
    def set_our_company
      @company = our_team.companies.find_by(id: params[:id])
    end

    def set_our_companies
      @companies = our_team.companies
    end

    def company_params
      params.require(:company).permit(:name, :website, :description)
    end
end
