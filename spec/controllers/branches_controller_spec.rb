require 'spec_helper'


describe BranchesController do

  # This should return the minimal set of attributes required to create a valid
  # Branch. As you add validations to Branch, be sure to
  # update the return value of this method accordingly.
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BranchesController. Be sure to keep this updated too.

	before(:each) do
		@org = FactoryGirl.create(:organization)
	end
	
  describe "GET index" do
    it "assigns all branches as @branches" do
      branch1 = FactoryGirl.create(:branch, organization: @org)
      branch2 = FactoryGirl.create(:branch, organization: @org)
      
      get :index, {:organization_id => @org.id}
      assigns(:branches).should eq([branch1, branch2])
    end
    
    
  end

  describe "GET show" do
    it "assigns the requested branch as @branch" do
      branch = FactoryGirl.create(:branch, organization: @org)
      get :show, {:id => branch.to_param, :organization_id => @org.id}
      assigns(:branch).should eq(branch)
    end
  end

  describe "GET new" do
    it "assigns a new branch as @branch" do
      get :new, {:organization_id => @org.id}
      assigns(:branch).should be_a_new(Branch)
    end
  end

  describe "GET edit" do
    it "assigns the requested branch as @branch" do
    
      branch = FactoryGirl.create(:branch, organization: @org)
      get :edit, {:id => branch.to_param, :organization_id => @org.id}
      assigns(:branch).should eq(branch)
    end
  end

#  describe "POST create" do
#    describe "with valid params" do
#      it "creates a new Branch" do
#        expect {
#          post :create, {:branch => valid_attributes, organization: @org}, valid_session
#        }.to change(Branch, :count).by(1)
#      end

#      it "assigns a newly created branch as @branch" do
#        post :create, {:branch => {:name => 'kjdffd',  }, organization: @org}, valid_session
#        assigns(:branch).should be_a(Branch)
#        assigns(:branch).should be_persisted
#      end

#      it "redirects to the created branch" do
#        post :create, {:branch => valid_attributes, organization: @org}, valid_session
#        response.should redirect_to(Branch.last)
#      end
#    end

#    describe "with invalid params" do
#      it "assigns a newly created but unsaved branch as @branch" do
#        # Trigger the behavior that occurs when invalid params are submitted
#        Branch.any_instance.stub(:save).and_return(false)
#        post :create, {:branch => {}}, valid_session
#        assigns(:branch).should be_a_new(Branch)
#      end

#      it "re-renders the 'new' template" do
#        # Trigger the behavior that occurs when invalid params are submitted
#        Branch.any_instance.stub(:save).and_return(false)
#        post :create, {:branch => {}}, valid_session
#        response.should render_template("new")
#      end
#    end
#  end

  describe "PUT update" do
#    describe "with valid params" do
      it "updates the requested branch" do
        branch = FactoryGirl.create(:branch, organization: @org)
        # Assuming there are no other branches in the database, this
        # specifies that the Branch created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Branch.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => branch.to_param, :branch => {'these' => 'params'}, :organization_id => @org.id}
      end
	end
#      it "assigns the requested branch as @branch" do
#        branch = Branch.create! valid_attributes
#        put :update, {:id => branch.to_param, :branch => valid_attributes,:organization_id => @org.id}, valid_session
#        assigns(:branch).should eq(branch)
#      end

#      it "redirects to the branch" do
#        branch = Branch.create! valid_attributes
#        put :update, {:id => branch.to_param, :branch => valid_attributes,:organization_id => @org.id}, valid_session
#        response.should redirect_to(branch)
#      end
#    end

#    describe "with invalid params" do
#      it "assigns the branch as @branch" do
#        branch = Branch.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        Branch.any_instance.stub(:save).and_return(false)
#        put :update, {:id => branch.to_param, :branch => {}, :organization_id => @org.id}, valid_session
#        assigns(:branch).should eq(branch)
#      end

#      it "re-renders the 'edit' template" do
#        branch = Branch.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        Branch.any_instance.stub(:save).and_return(false)
#        put :update, {:id => branch.to_param, :branch => {}, :organization => @org.id}, valid_session
#        response.should render_template("edit")
#      end
#    end
#  end

  describe "DELETE destroy" do
    it "destroys the requested branch" do
      branch = FactoryGirl.create(:branch, organization: @org)
      expect {
        delete :destroy, {:id => branch.to_param, :organization_id => @org.id}
      }.to change(Branch, :count).by(-1)
    end

    it "redirects to the branches list" do
      branch = FactoryGirl.create(:branch, organization: @org)
      delete :destroy, {:id => branch.to_param, :organization_id => @org.id }
      response.should redirect_to(organization_branches_url)
    end
  end

end
