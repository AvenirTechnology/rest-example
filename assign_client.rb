require 'rest-client'
require 'json'

base = 'http://byma.avenir.tech:3000/v1/assignment'

# assign some collateral

assign = RestClient::Request.new(
    :method         => :post,
    :url            => base + '/create',
    :payload        => {
        :org            => 'BNPP',
        :account        => '3493',
        :date           => '20180503',
        :position       => 'INST-04-CAUCION',
        :instrument     => 'ARS',
        :quantity       => 50,
    }
)
response = assign.execute
puts "#{response}"


# get assigned balance for the position

assigned = RestClient::Request.new(
    :method         => :get,
    :url            => base + '/balance',
    :payload        => {
        :org            => 'BNPP',
        :account        => '3493',
        :position       => 'INST-04-CAUCION',
    }
)
response = assigned.execute
puts "#{response}"


# get assigned balance for all positions for this org

assigned = RestClient::Request.new(
    :method         => :get,
    :url            => base + '/balance',
    :payload        => {
        :org            => 'BNPP',
        :account        => '3493',
    }
)
response = assigned.execute
puts "#{response}"


# reduce collateral assignment

remove = RestClient::Request.new(
    :method         => :post,
    :url            => base + '/remove',
    :payload        => {
        :org            => 'BNPP',
        :account        => '3493',
        :date           => '20180503',
        :position       => 'INST-04-CAUCION',
        :instrument     => 'ARS',
        :quantity       => 50,
    }
)
response = remove.execute
puts "#{response}"


# bulk collateral assignment (reconciliation)

f = File.new('./files/Instrument_Bond.xml', 'rb')

bulk = RestClient::Request.new(
    :method         => :post,
    :url            => base + '/bulk',
    :payload        => {
        :multipart      => true,
        :file           => f,
    }
)
response = bulk.execute
puts "#{response}"
