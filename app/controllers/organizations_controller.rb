class OrganizationsController < ApplicationController
  include Activation 
  def index	
    @organizations = Organization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organizations }
    end
  end

 
  def show
  	@organization = Organization.find(params[:id])
    @branches = @organization.branches
	end
	
  def new
    @organization = Organization.new
    @branch = @organization.branches.new
    @contract = @organization.build_contract
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organization }
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def create
    @organization = Organization.new(params[:organization])
		org_valid = @organization.valid?
		@branch = @organization.branches.new(params[:branch])
		@contract = @organization.build_contract(params[:contract])
    branch_valid = @branch.valid?
		
    respond_to do |format|	
      
      if org_valid && branch_valid && @contract.valid?
      	@organization.save!
      	@contract.save!
      	@branch.save(:validate => false)
      	format.html { redirect_to @organization, notice: 'successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
    end
  end

end
