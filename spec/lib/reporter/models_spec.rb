require File.dirname(__FILE__) + '/../../spec_helper'

describe "specifying that a model is a reporter" do
  describe "with the controller option" do
    it 'specified, assigns the given controller' do
      Report.make(:name => 'some_report')
      class HelliController; end
      class Hello < ActiveRecord::Base
        set_table_name 'reports'
        reporter :controller => "HelliController"
      end
      Hello.reporter_controller.should == HelliController
    end
    it 'not specified, guesses the controller' do
      Report.reporter_controller.should == ReportController
    end
  end
  it "tries to guess the " do
    Report.should_receive(:regenerate_reports).and_return(true)
    Report.send(:reporter)
  end
end

describe "regenerating reports" do
  it 'tells each report to create a controller action, and view' do
  end

end
