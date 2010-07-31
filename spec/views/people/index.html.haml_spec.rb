require 'spec_helper'

describe "people/index.html.haml" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :name => "Name",
        :sex => "Sex"
      ),
      stub_model(Person,
        :name => "Name",
        :sex => "Sex"
      )
    ])
  end

  it "renders a list of people" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Sex".to_s, :count => 2)
  end
end
