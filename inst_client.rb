require 'rest-client'

fbond   = File.new('./files/Instrument_Bond.xml', 'rb')
fequity = File.new('./files/Instrument_Equity.xml', 'rb')
ffuture = File.new('./files/Instrument_Future.xml', 'rb')
foption = File.new('./files/Instrument_Option.xml', 'rb')
frepo   = File.new('./files/Instrument_Repo.xml', 'rb')
fsbl    = File.new('./files/Instrument_SBL.xml', 'rb')

base = 'http://byma.avenir.tech:3000'

request = RestClient::Request.new(
   :method     => :get,
   :url        => base,
   :timeout    => 10,
)
response = request.execute
puts "#{response}"

get_inst = RestClient::Request.new(
    :method         => :get,
    :url            => base + '/v1/inst/AT',
    :timeout        => 10,
);

response = get_inst.execute
puts "#{response}"


bulk_inst = RestClient::Request.new(
    :method         => :post,
    :url            => base + '/v1/inst/bulk',
    :timeout        => 10,
    :payload        => {
        :multipart      => true,
        :file           => fbond
    }
)

response = bulk_inst.execute
puts "#{response}"