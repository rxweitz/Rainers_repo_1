#!/usr/bin/env ruby

class Item < String
  
  def quantity
    split.first.to_i
  end
  
  def price
    split.last.to_f
  end
  
  def cost
    quantity * price
  end
  
  def description
    split[1..-3].join(' ')
  end
  
  def imported?
    if self =~ /(imported)/
      true
    else
      false
    end
  end
  
  def taxable?
    if self =~ /(book)/ || self =~ /(chocolate)/ || self =~ /(pills)/
      false
    else
      true
    end
  end
  
end

class SalesTax

  def calculateTax(price, rate)
    tax = (20 * price * rate).ceil / 20.0
    return tax
  end

  def CalculateSalesTax(input)

    # Initialize variables
    output = Array.new
    totalCost = 0
    totalTax = 0

    # Loop through each item in the input array
    input.each do |line|
      item = Item.new(line)
      if item.imported?
        importTax = calculateTax(item.cost, 0.05)
      else
        importTax = 0
      end
      if item.taxable?
        salesTax = calculateTax(item.cost, 0.1)
      else
        salesTax = 0
      end
      tax = importTax + salesTax
      totalTax += tax
      cost = (item.cost + tax).round(2)
      totalCost += cost
      output << "#{item.quantity} #{item.description}: #{"%.2f" % cost}"
    end

    # Add the totals
    output << "Sales Taxes: #{"%.2f" % totalTax}"
    output << "Total: #{"%.2f" % totalCost}"
   
    # Return the output array
    return output
  end
end


if __FILE__ == $0

  st = SalesTax.new
  input = Array.new
  
  # Prompt the user for imput
  puts "Enter each item followed by Return."
  puts "Press Return twice to calculate sales tax."
  begin
    line = gets.to_s.chomp
    if !line.empty?
      input << line
    end
  end until line.empty?

  # Display the results
  puts
  puts st.CalculateSalesTax(input)

end