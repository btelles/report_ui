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

  describe "available_columns" do
    it "returns all columns and whether they are used or not" do
      ::Reporter::ReportableColumns = [Person]
      a = Report.new()
      a.used_columns = ['Person#last_name', "Person#first_name"]
      a.available_columns.should == {Person => {:last_name     => true,
                                                :first_name    => true,
                                                :id            => false,
                                                :date_of_birth => false,
                                                :amount        => false}}
    end
  end
end
