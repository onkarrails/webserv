require 'spec_helper'


describe OrganizationsController do

	before (:each) do
    Organization.all.each(&:destroy)
  end
	
	

  describe "GET index" do
    it "assigns all organizations as @organizations" do
      organization = FactoryGirl.create(:organization)
      get :index
      assigns(:organizations).should eq([organization])
    end
  end

  describe "GET show" do
    it "assigns the requested organization as @organization" do
      organization = FactoryGirl.create(:organization)
      get :show, {:id => organization.to_param}
      assigns(:organization).should eq(organization)
    end
  end

  describe "GET new" do
    it "assigns a new organization as @organization" do
      get :new
      assigns(:organization).should be_a_new(Organization)
    end
  end

  describe "GET edit" do
    it "assigns the requested organization as @organization" do
      organization = FactoryGirl.create(:organization)
      get :edit, {:id => organization.to_param}
      assigns(:organization).should eq(organization)
    end
  end

  
  describe "POST create" do

	 describe "with valid params" do
      it "creates a new Organization" do
        expect {
          post :create, {:organization=>
                          { name: "Orgaanizaname", organization_type: "insurance_firm", address_line1: "Madiwala",
                            address_line2: "Address2", city: "Blr1", state: "AL", zip: "11111",
                            unused_claim_store_days: "23", accepted_threshold: "26", service_bureau: "0",
                            email: "aaaa@aaa.com"},
                            :contract =>{'start_date(1i)' => "2012", 'start_date(2i)' => "5", 'start_date(3i)' => "1",
                            :duration => "3"},
                       :branch =>
                          { name: "dfdfdfd", address_line1: "dfvgdfgdg", address_line2: "", 
                          state: "fdgsgsfgsg", zip: "24242", email: "sreehari@activesphere.com"}
                      }
        }.to change(Organization, :count).by(1), change(Branch, :count).by(1)
      end

      it "assigns a newly created organization as @organization" do
        post :create, {:organization=>
                          { name: "OrgName", organization_type: "insurance_firm", address_line1: "pfddssds",
                            address_line2: "madiwala", city: "blr", state: "AL", zip: "33333",
                            unused_claim_store_days: "231", accepted_threshold: "4321", service_bureau: "0",
                            email: "bcd@bcd.com"},
                            :contract =>{'start_date(1i)' => "2012", 'start_date(2i)' => "5", 'start_date(3i)' => "1",
                            :duration => "3"},
                       :branch =>
                          { name: "fdfdfd", address_line1: "dfvgdfgdg", address_line2: "", 
                          state: "fdgsgsfvvvcgsg", zip: "22222", email: "abc@abc.com"}
                      }
        assigns(:organization).should be_a(Organization)
        assigns(:organization).should be_persisted
        assigns(:branch).should be_a(Branch)
        assigns(:branch).should be_persisted
        assigns(:contract).should be_a(Contract)
        assigns(:contract).should be_persisted
      end

      it "redirects to the created organization" do
        post :create, {:organization=>
                          { name: "omkk", organization_type: "insurance", address_line1: "pssds",
                            address_line2: "dadss", city: "dsdsds", state: "AL", zip: "12321",
                            unused_claim_store_days: "232", accepted_threshold: "22", service_bureau: "0",
                            email: "abc@abc.com"},
                            :contract =>{'start_date(1i)' => "2012", 'start_date(2i)' => "5", 'start_date(3i)' => "1",
                            :duration => "3"},
                       :branch =>
                          { name: "dfdfdfd", address_line1: "dfvgdfgdg", address_line2: "", 
                          state: "fdgsgsfgsg", zip: "11111", email: "ram@em.com"}
                      }
        response.should redirect_to(Organization.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved organization as @organization" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, {:organization => { name: "sdfsj", address_line1: "fgydj", city: "", state: "", zip: ""},
        								:branch => { name: "sdgs", address_line1: "",  state: ""}
        }
        assigns(:organization).should be_a_new(Organization)
        assigns(:branch).should be_a_new(Branch)
      	assigns(:contract).should be_a_new(Contract)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create,{:organization=>{}, :branch => {}, :contract =>{}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested organization" do
        organization = FactoryGirl.create(:organization)
        put :update, {:id => organization.to_param, :organization => { name: "sddddd", organization_type: "insurance", address_line1: "pssds",
                            address_line2: "dadss", city: "dsdsds", state: "AL", zip: "12321",
                            unused_claim_store_days: "232", accepted_threshold: "22", service_bureau: "0",
                            email: "abc@abc.com"}}
      
      	organization.reload.name.should == 'sddddd'
      end
      
       it "redirects to the organization" do
       		organization = FactoryGirl.create(:organization)
        	post :update, {:id => organization.to_param, :organization=>
                          { name: "omkk", organization_type: "insurance", address_line1: "pssds",
                            address_line2: "dadss", city: "dsdsds", state: "AL", zip: "12321",
                            unused_claim_store_days: "232", accepted_threshold: "22", service_bureau: "0",
                            email: "abc@abc.com"}
                      }
        	response.should redirect_to(organization)
        end
    end

    describe "with invalid params" do
      it "assigns the organization as @organization" do
        organization = FactoryGirl.create(:organization)
        put :update, {:id => organization.to_param, :organization => {:name => ''}}
        assigns(:organization).should eq(organization)
      end

      it "re-renders the 'edit' template" do
        organization = FactoryGirl.create(:organization) 
        put :update, {:id => organization.to_param, :organization => {:name => ''}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested organization" do
      organization = FactoryGirl.create(:organization)
      expect {
        delete :destroy, {:id => organization.to_param}
      }.to change(Organization, :count).by(-1)
    end

    it "redirects to the organizations list" do
      organization = FactoryGirl.create(:organization)
      delete :destroy, {:id => organization.to_param}
      response.should redirect_to(organizations_url)
    end
  end

end
