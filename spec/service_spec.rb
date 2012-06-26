#require File.dirname(__FILE__) + '/../service.rb'
require_relative '../service.rb'

require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

describe 'service test' do
  include Rack::Test::Methods
  
  it "should reverse the string you provide it" do
    reverse('banana').should == 'ananab'
  end
  
  it "should load the home page" do
    get '/'
    last_response.should be_ok
    last_response.status.should == 200
  end
  
  it "should reverse posted values too" do
    post '/' , params = {:str => 'banana'}
    last_response.body.should == 'ananab'
  end

end
