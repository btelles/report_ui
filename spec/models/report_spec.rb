require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Report do
  describe "requires at least one column" do
    new_report = Report.new(:used_columns => nil)
    new_report.save.should == false
    new_report.errors[:used_columns][0].should =~ /blank/
  end
  describe "query" do
    it 'returns an arel query' do

    end
  end

  describe "#available_columns" do
    it "returns all columns and whether they are used or not" do
      ::Reporter.reportable_models = [Person]
      a = Report.new()
      a.used_columns = ['Person#last_name', "Person#first_name"]
      a.available_columns.should == {Person => {:last_name     => true,
                                                :first_name    => true,
                                                :id            => false,
                                                :date_of_birth => false,
                                                :amount        => false}}
    end
  end

  describe "#humanized_column_names" do
    it 'returns pretty names of the intended columns' do
      report = Report.new(:used_columns => ["Person#name", "SomeClass#date_at"])
      report.humanized_column_names.should == ['Name', 'Date at']
    end
  end
  describe "#column_names" do
    it 'returns just the names of the intended columns' do
      report = Report.new(:used_columns => ["Person#name", "SomeClass#date_at"])
      report.column_names.should == ['name', 'date_at']
    end
  end

  describe "#data" do
    it "returns an executed query" do
      Person.create(:last_name => 'smith')
      Person.create(:last_name => 'roberts')
      report = Report.new(:code => "Person.select('last_name').where('last_name = \"smith\"')")
      report.data.map(&:last_name).should include 'smith'
      report.data.map(&:last_name).should_not include 'roberts'
    end
  end
end
