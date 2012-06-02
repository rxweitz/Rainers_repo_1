require_relative 'SalesTax.rb'

describe "Input 1" do

  it "CalculateSalesTax should return Output 1" do
  
    input1 = ['1 book at 12.49',
      '1 music CD at 14.99',
      '1 chocolate bar at 0.85']
       
    output1 = ['1 book: 12.49',
      '1 music CD: 16.49',
      '1 chocolate bar: 0.85',
      'Sales Taxes: 1.50',
      'Total: 29.83']
      
    st = SalesTax.new
    st.CalculateSalesTax(input1).should == output1
  end
end

describe "Input 2" do

  it "CalculateSalesTax should return Output 2" do

    input2 = ['1 imported box of chocolates at 10.00',
      '1 imported bottle of perfume at 47.50']

    output2 = ['1 imported box of chocolates: 10.50',
      '1 imported bottle of perfume: 54.65',
      'Sales Taxes: 7.65',
      'Total: 65.15']

    st = SalesTax.new
    st.CalculateSalesTax(input2).should == output2
  end
end

describe "Input 3" do

  it "CalculateSalesTax should return Output 3" do

    input3 = ['1 imported bottle of perfume at 27.99',
      '1 bottle of perfume at 18.99',
      '1 packet of headache pills at 9.75',
      '1 box of imported chocolates at 11.25']

    output3 = ['1 imported bottle of perfume: 32.19',
      '1 bottle of perfume: 20.89',
      '1 packet of headache pills: 9.75',
      '1 box of imported chocolates: 11.85',
      'Sales Taxes: 6.70',
      'Total: 74.68']

    st = SalesTax.new
    st.CalculateSalesTax(input3).should == output3
  end
end