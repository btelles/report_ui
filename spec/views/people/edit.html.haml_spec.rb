require 'spec_helper'

describe "people/edit.html.haml" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :new_record? => false,
      :name => "MyString",
      :sex => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    rendered.should have_selector("form", :action => person_path(@person), :method => "post") do |form|
      form.should have_selector("input#person_name", :name => "person[name]")
      form.should have_selector("input#person_sex", :name => "person[sex]")
    end
  end
end
