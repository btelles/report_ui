require File.dirname(__FILE__) + '/../../spec_helper'

describe "specifying that a model is a reporter" do
  describe "with the controller option" do
    it 'specified, assigns the given controller' do
      Report.make(:name => 'some_report')
      Hello.reporter_controller.should == HeiController
    end
    it 'not specified, guesses the controller' do
      Report.reporter_controller.should == ReportController
    end
  end
  describe "result_data" do
    it "executes Ruby and returns an array of AR objects" do
      person = Person.make(:last_name => 'smith')
      report = Report.make(:language => 'ruby',
                           :query => 'Person.where("last_name = \'smith\'")')

      report.report_data.should have(1).record
      report.report_data[0].should == person
    end
    it "executes SQL and returns an array of AR objects" do
      person = Person.make(:last_name => 'smith')
      report = Report.make(:language => 'sql',
                           :query => "select * from people where last_name = 'smith'")

      report.report_data.should have(1).record
      report.report_data[0].last_name.should == 'smith'
      report.report_data[0].id.should == person.id
    end
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
