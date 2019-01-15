require 'avatax-v1'

# Header Level Elements
# Required Header Level Elements
AvaTaxV1.configure_from 'credentials.yml'

taxSvc = AvaTaxV1::TaxService.new

#Required Request Parameters
location = {
  :latitude => "47.627935",
  :longitude => "-122.51702"
}
saleAmount = 10

# Call the service
geoTaxResult = taxSvc.estimate(location, saleAmount)

# Print Results
puts "EstimateTaxTest ResultCode: "+geoTaxResult["ResultCode"]
if geoTaxResult["ResultCode"] != "Success"
  geoTaxResult["Messages"].each { |message| puts message["Summary"] }
else
  puts "Total Rate: " + geoTaxResult["Rate"].to_s + " Total Tax: " + geoTaxResult["Tax"].to_s
  #Show the tax amount calculated at each jurisdictional level
  geoTaxResult["TaxDetails"].each do |taxDetail|
    puts "   " + "Jurisdiction: " + taxDetail["JurisName"] + " Tax: " + taxDetail["Tax"].to_s
  end
end
