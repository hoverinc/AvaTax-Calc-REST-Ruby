require 'avatax-v1'

# Header Level Elements
# Required Header Level Elements
AvaTaxV1.configure_from 'credentials.yml'

taxSvc = AvaTaxV1::TaxService.new

pingResult = taxSvc.ping

#Display the result
puts "PingTest ResultCode: "+ pingResult["ResultCode"]
if pingResult["ResultCode"] != "Success"
  pingResult["Messages"].each { |message| puts message["Summary"] }
end
