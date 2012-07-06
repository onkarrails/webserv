require 'spec_helper'

describe "organizations/index" do
  before(:each) do
    assign(:organizations, [
      stub_model(Organization,
        :name => "Name",
        :organization_type => "Organization Type",
        :state => "State",
        :unused_claim_store_days => 1,
        :email => "Email"
      ),
      stub_model(Organization,
        :name => "Name",
        :organization_type => "Organization Type",
        :state => "State",
        :unused_claim_store_days => 1,
        :email => "Email"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Organization Type".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
