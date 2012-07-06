require 'spec_helper'

describe "organizations/edit" do
  before(:each) do
    @organization = assign(:organization, stub_model(Organization,
      :name => "MyString",
      :organization_type => "MyString",
      :state => "MyString",
      :unused_claim_store_days => 1,
      :email => "MyString"
    ))
  end

  it "renders the edit organization form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => organizations_path(@organization), :method => "post" do
      assert_select "input#organization_name", :name => "organization[name]"
      assert_select "input#organization_organization_type", :name => "organization[organization_type]"
      assert_select "input#organization_state", :name => "organization[state]"
      assert_select "input#organization_unused_claim_store_days", :name => "organization[unused_claim_store_days]"
      assert_select "input#organization_email", :name => "organization[email]"
    end
  end
end
