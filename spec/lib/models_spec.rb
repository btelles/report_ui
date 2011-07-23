require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "ReportUi::Models" do
  it 'adding reportable to a model adds that model to the list of reportable models' do
    ::ReportUi.reportable_models.should include Person
  end
end
