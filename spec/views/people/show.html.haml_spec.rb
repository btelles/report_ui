require 'spec_helper'

describe "people/show.html.haml" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :name => "Name",
      :sex => "Sex"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Sex".to_s)
  end
end
