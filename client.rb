require 'rest-client'

fbond   = File.new('./files/Instrument_Bond.xml', 'rb')
fequity = File.new('./files/Instrument_Equity.xml', 'rb')
ffuture = File.new('./files/Instrument_Future.xml', 'rb')
foption = File.new('./files/Instrument_Option.xml', 'rb')
frepo   = File.new('./files/Instrument_Repo.xml', 'rb')
fsbl    = File.new('./files/Instrument_SBL.xml', 'rb')

request = RestClient::Request.new(
    :method         => :post,
    :url 	        => 'http://192.168.56.100:3000/inst/bulk',
    :payload        => {
        :multipart      => true,
        :file           => fbond
    }
)

response = request.execute
puts "#{response}"

request = RestClient::Request.new(
    :method     => :post,
    :url        => 'http://192.168.56.100:3000/inst/bulk',
    :payload    => {
        :multipart  => true,
        :file       => fequity
    }
)

response = request.execute
puts "#{response}"
