require 'spec_helper'

describe "branches/new" do
  before(:each) do
    assign(:branch, stub_model(Branch,
      :name => "MyString",
      :state => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new branch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => branches_path, :method => "post" do
      assert_select "input#branch_name", :name => "branch[name]"
      assert_select "input#branch_state", :name => "branch[state]"
      assert_select "input#branch_email", :name => "branch[email]"
    end
  end
end
