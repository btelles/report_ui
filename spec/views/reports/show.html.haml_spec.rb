require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "reports/show.html.haml" do
  it 'lists all columns as table headers' do
    view.should_receive(:report).at_least(1).and_return(Report.new(:used_columns => ['Person#last_name'],
                  :code => "Person.all"))
    render :template => 'reports/show.html.haml'
    rendered.should have_selector('th:contains("Last name")')
  end
end
