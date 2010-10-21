require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

def mock_report(stubs = {})
  mock_model(Report, {:id => 1,
                      :name => 'some report',
                      :description => 'aoeu'}.merge(stubs))
end
describe "reports#index" do
  it "Shows a list of given reports" do
    view.should_receive(:reports).at_least(1).times.and_return([mock_report])
    view.stub(:custom_reports => [])
    render :template => 'reports/index'
    rendered.should have_selector("td:contains('some report')")
  end
  it "if no reports are present, it tells the user so" do
    view.should_receive(:reports).at_least(1).times.and_return([])
    view.stub(:custom_reports => [])
    render :template => 'reports/index'
    rendered.should contain("no canned")
  end
end
