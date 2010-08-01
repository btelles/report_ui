require File.dirname(__FILE__) + '/../spec_helper'

describe "named route report_with_last_name_smith_path" do
  before :all do
    Report.make
    Person.make
  end
  #it "maps /report_with_last_name_smith" do
  #  route_for(:controller => 'reports', :action => 'report_with_last_name_smith').should == '/report_with_last_name_smith'
  #end

  #it "generates params for #report_with_last_name_smith" do
  #  params_from(:get, '/report_with_last_name_smith').should == {:controller => 'reports', :action => 'report_with_last_name_smith'}
  #end

  #it 'recognizes report_with_last_name_smith_path' do
  #  report_with_last_name_smith_path.should == '/report_with_last_name_smith'
  #end
end
