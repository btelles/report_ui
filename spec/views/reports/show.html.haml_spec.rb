require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "reports/show.html.haml" do
  it 'lists all columns as table headers' do
    view.should_receive(:report).at_least(1).and_return(Report.new(:used_columns => ['hi', 'ho', 'he'],
                  :code => "Person.all"))
    render :template => 'reports/show.html.haml'
    rendered.should have_selector('th:contains("hi")')
    rendered.should have_selector('th:contains("ho")')
    rendered.should have_selector('th:contains("he")')
  end
end
