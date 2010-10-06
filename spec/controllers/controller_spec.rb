require File.dirname(__FILE__) + '/../spec_helper'

describe "controller methods" do
  before do
    @person = Person.make(:last_name => 'smith')
    @rep = Report.make(:name => "Some Report",
                       :query => "Person.where(\"last_name = 'smith'\")")
  end
  describe "generates a " do

    it "controller action for every record" do
      ReportController.instance_methods.sort.should include(:report_some_report)
    end

  end

  describe "each action" do
    it 'assigns report record to @report' do
      get :report_some_report
      assigns[:report].should == @rep
    end
  end
end
