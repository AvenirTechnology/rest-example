require 'rest-client'
require 'json'

base = 'http://byma.avenir.tech:3000'


# deposit some collateral

deposit = RestClient::Request.new(
    :method     => :post,
    :url        => base + '/v1/collateral/deposit',
    :payload    => {
        :instrument => 'AT',
        :date       => '20180503',
        :org        => 'BNPP',
        :account    => '3493',
        :quantity   => '50'
    }
)
response = deposit.execute
puts "#{response}"


# check the status of the transaction

json = JSON.parse(response)
ref = json['reference']

resp = RestClient.get base + '/v1/collateral/' + ref
puts "#{resp}"


# try and withdraw the collateral

withdraw = RestClient::Request.new(
    :method     => :post,
    :url        => base + '/v1/collateral/withdraw',
    :payload    => {
        :instrument     => 'AT',
        :date           => '20180503',
        :org            => 'BNPP',
        :account        => '3493',
        :quantity       => '50'
    }
)
response = withdraw.execute
puts "#{response}"


# check the status of the widthdraw transaction

json = JSON.parse(response)
ref = json['reference']

resp = RestClient.get base + '/v1/collateral/' + ref
puts "#{resp}"


# collateral reconciliation

fbond   = File.new('./files/Instrument_Bond.xml', 'rb')

reconcile = RestClient::Request.new(
    :method     => :post,
    :url        => base + '/v1/collateral/bulk',
    :payload    => {
        :category       => :security,
        :multipart      => true,
        :file           => fbond,
    }
)

response = reconcile.execute
puts "#{response}"
