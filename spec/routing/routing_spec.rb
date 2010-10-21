require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "named route report_with_last_name_smith_path" do
  it "maps /reports" do
    url_for(:host => 'a.com', :controller => 'reports', :action => 'index').should == 'http://a.com/reports'
  end
  describe "GET" do
    it "has routes for new" do
      url_for(:host => 'a.com', :controller => 'reports', :action => 'new').should == 'http://a.com/reports/new'
    end
    it "has routes for show" do
      url_for(:host => 'a.com', :controller => 'reports', :action => 'show', :id => 1).should == 'http://a.com/reports/1'
    end
    it "has routes for edit" do
      url_for(:host => 'a.com', :controller => 'reports', :action => 'edit', :id => 1).should == 'http://a.com/reports/1/edit'
    end
  end
end
