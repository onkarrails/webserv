require 'spec_helper'

describe "branches/show" do
  before(:each) do
    @branch = assign(:branch, stub_model(Branch,
      :name => "Name",
      :state => "State",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/State/)
    rendered.should match(/Email/)
  end
end
