require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Report do
  describe "requires at least one column" do
    new_report = Report.new(:cols => nil)
    new_report.save.should == false
    new_report.errors[:cols][0].should =~ /blank/
  end
  describe "query" do
    it 'returns an arel query' do

    end
  end
end
