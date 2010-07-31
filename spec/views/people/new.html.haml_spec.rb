require 'spec_helper'

describe "people/new.html.haml" do
  before(:each) do
    assign(:person, stub_model(Person,
      :new_record? => true,
      :name => "MyString",
      :sex => "MyString"
    ))
  end

  it "renders new person form" do
    render

    rendered.should have_selector("form", :action => people_path, :method => "post") do |form|
      form.should have_selector("input#person_name", :name => "person[name]")
      form.should have_selector("input#person_sex", :name => "person[sex]")
    end
  end
end
