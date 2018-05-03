require 'rest-client'

fbond   = File.new('./files/Instrument_Bond.xml', 'rb')

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
