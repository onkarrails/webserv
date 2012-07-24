require 'spec_helper'

describe Organization do
  describe 'send_invitation' do
  	it 'should create a user' do
  		org = FactoryGirl.create(:organization, :name => 'org2', :email => 'tests@gmail.com')
  		User.find_by_email('tests@gmail.com').should_not be_nil
  	end
  	 
  	it 'should send invitation mail' do
  		mock_object = mock
  		UserMailer.should_receive(:invite_organization_admin).and_return(mock_object)
  		mock_object.should_receive(:deliver)
  		org = FactoryGirl.create(:organization, :name => 'org2')

  	end
  end
end
