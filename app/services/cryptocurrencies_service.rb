# frozen_string_literal: true

require 'rest_client'

class CryptocurrenciesService
  attr_reader :base_url
  def initialize
    @base_url = ENV['COINMARKET_BASE_URL']
  end

  # returns array of top crypto currencies
  def get_top
    url = base_url + 'cryptocurrency/listings/latest'
    fetch_data(url)
  end

  # call api to get data
  def fetch_data(url)
    response = RestClient.get(url, headers)
    JSON.parse(response)['data']
  end

  # header to pass in cryptocurrency api
  def headers
    {
      'X-CMC_PRO_API_KEY' => ENV['COINMARKET_API_KEY'],
      content_type: :json,
      accept: :json,
      params: params
    }
  end

  # parameters to pass in api
  def params
    {
      start: 1,
      limit: 10,
      convert: 'USD'
    }
  end
end
