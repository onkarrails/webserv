class BranchesController < ApplicationController
	before_filter :find_organization

  def index
    @branches = @organization.branches

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @branch = Branch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @branch }
    end
  end

  def new
    @branch = @organization.branches.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @branch }
    end
  end

  def edit
    @branch = Branch.find(params[:id])
  end

  def create
    @branch = @organization.branches.new(params[:branch])


      if @branch.save
       redirect_to [@organization, @branch], notice: 'Branch was successfully created.' 
      else
        render action: "new"
      end
  end

  def update
    @branch = Branch.find(params[:id])

    respond_to do |format|
      if @branch.update_attributes(params[:branch])
        format.html { redirect_to [@organization, @branch], notice: 'Branch was successfully updated.' }
      else
        format.html { render action: "edit" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @branch = Branch.find(params[:id])
    @branch.destroy

    respond_to do |format|
      format.html { redirect_to organization_branches_url }
      format.json { head :no_content }
    end
  end
  
private
	
	def find_organization
		@organization = Organization.find(params[:organization_id])
	end
end
