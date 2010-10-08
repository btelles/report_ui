require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "named route report_with_last_name_smith_path" do
  it "maps /reports" do
    url_for(:host => 'a.com', :controller => 'reports', :action => 'index').should == 'http://a.com/reports'
  end
  #it "generates params for #report_with_last_name_smith" do
  #  params_from(:get, '/report_with_last_name_smith').should == {:controller => 'reports', :action => 'report_with_last_name_smith'}
  #end

  #it 'recognizes report_with_last_name_smith_path' do
  #  report_with_last_name_smith_path.should == '/report_with_last_name_smith'
  #end
end
