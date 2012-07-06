require 'spec_helper'

describe "organizations/show" do
  before(:each) do
    @organization = assign(:organization, stub_model(Organization,
      :name => "Name",
      :organization_type => "Organization Type",
      :state => "State",
      :unused_claim_store_days => 1,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Organization Type/)
    rendered.should match(/State/)
    rendered.should match(/1/)
    rendered.should match(/Email/)
  end
end
