require File.dirname(__FILE__) + '/../../spec_helper'

describe "specifying that a model is a reporter" do
  describe "with the controller option" do
    it 'specified, assigns the given controller' do
      Report.make(:name => 'some_report')
      class HeiController < ActionController::Base; end
      class Hello < ActiveRecord::Base
        set_table_name 'reports'
        reporter :controller => "HeiController"
      end
      Hello.reporter_controller.should == HeiController
    end
    it 'not specified, guesses the controller' do
      Report.reporter_controller.should == ReportController
    end
  end
  describe "generates a " do
    before do
      @rep = Report.make(:name => "Some Report",
                         :query => "Person.where(\"last_name = 'smith'\")")
    end
    it "controller action for every record" do
      ReportController.instance_methods.should include(:some_report)
    end
    it "route for every record"

  end
  describe "the controller's action" do
    it "returns report_data"
    it "renders the report's view"
    it "or the view can be overwritten"
    it "can be overwritten"
  end
end

describe "regenerating reports" do
  it 'tells each report to create a controller action, and view' do
  end

end
