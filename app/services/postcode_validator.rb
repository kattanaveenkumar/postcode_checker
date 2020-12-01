class PostcodeValidator
  include HttpStatusCodes

  API_ENDPOINT = 'https://api.postcodes.io/postcodes'.freeze
  ALLOWED_LSOAS =  %w[Southwark Lambeth].freeze
  ALLOWED_POSTCODES = ["SH241AA", "SH241AB"].freeze

  attr_reader :postcode
  
  def initialize(postcode=nil)
    @postcode = postcode.delete(' ').downcase
  end

  def call
    request(
      http_method: :get,
      endpoint: "#{API_ENDPOINT}/#{postcode}"
    )
  end

  private

  def client
    @_client ||= Faraday.new(API_ENDPOINT) do |client|
      client.request :url_encoded
      client.adapter Faraday.default_adapter
    end
  end

  def request(http_method:, endpoint:)
    @response = client.public_send(http_method, endpoint)

    return "Post code is allowed" if ALLOWED_POSTCODES.include?(@postcode.upcase)

    return 'Post Code cannot be blank' if postcode.blank?
    
    if response_successful?
      lsoa = JSON.parse(@response.body)['result']['lsoa']
      return ALLOWED_LSOAS.any? {|ls| lsoa.include? ls} ? "Post code is allowed" : 'Post code is not allowed'
    else
      error = JSON.parse(@response.body)['error']
      return "#{error}"
    end
  end

  def response_successful?
    @response.status == HTTP_OK_CODE
  end
end