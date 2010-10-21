require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Reporter::Models" do
  it 'adding reportable to a model adds that model to the list of reportable models' do
    ::Reporter::ReportableModels.should include Person
  end
end
