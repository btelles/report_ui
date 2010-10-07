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
      report = Report.make( :code => 'Person.where("last_name = \'smith\'")')
      report.report_data.should have(1).record
      report.report_data[0].should == person
    end
  end
end
