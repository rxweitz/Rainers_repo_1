#!/usr/bin/env ruby

class SalesTax

  def isTaxable(item)
    if item =~ /(book)/ || item =~ /(chocolate)/ || item =~ /(pills)/
      return false
    else
      return true
    end
  end

  def calcTax(price, rate)
    tax = (20 * price * rate).ceil / 20.0
    return tax
  end

  def CalculateSalesTax(input)

    # Initialize variables
    output = Array.new
    totalCost = 0
    totalTax = 0
    i = 0

    # Loop through each item in the input array
    input.each do |item|
      sTax = 0
      iTax = 0
      strQty = item.split[0]
      qty = strQty.to_i
      price = item.split.last.to_f
      description = item[strQty.length, (item.index(' at ') - strQty.length)].strip
      if item =~ /(imported)/
        iTax = calcTax(price, 0.05)
      end
      if isTaxable(item)
        sTax = calcTax(price, 0.1)
      end
      tax = iTax + sTax
      totalTax += tax
      cost = ((price + tax) * qty).round(2)
      totalCost += cost
      output[i] = "#{qty} #{description}: #{"%.2f" % cost}"
      i += 1
    end

    # Add the totals
    output[i] = "Sales Taxes: #{"%.2f" % totalTax}"
    output[i+1] = "Total: #{"%.2f" % totalCost}"
    
    # Return the output array
    return output
  end
end

if __FILE__ == $0
  st = SalesTax.new
  input = Array.new
  i = 0
  begin
    line = gets.to_s.chomp
    if !line.empty?
      input[i] = line
      i += 1
    end
  end until line.empty?
  puts
  puts st.CalculateSalesTax(input)
end