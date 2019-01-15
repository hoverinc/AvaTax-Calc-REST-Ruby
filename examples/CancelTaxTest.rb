require 'avatax-v1'

# Header Level Elements
# Required Header Level Elements
AvaTaxV1.configure_from 'credentials.yml'

taxSvc = AvaTaxV1::TaxService.new

cancelTaxRequest = {
    # Required Request Parameters
    :CompanyCode => "APITrialCompany",
    :DocType => "SalesInvoice",
    :DocCode => "INV001",
    :CancelCode => "DocVoided"
    }

cancelTaxResult = taxSvc.cancel(cancelTaxRequest)

# Print Results
puts "CancelTaxTest ResultCode: "+cancelTaxResult["ResultCode"]
if cancelTaxResult["ResultCode"] != "Success"
  cancelTaxResult["Messages"].each { |message| puts message["Summary"] }
end
