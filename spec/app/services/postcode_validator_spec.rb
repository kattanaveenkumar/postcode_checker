# frozen_string_literal: true

require 'rails_helper'
require "faraday"
require "json"
require "oj"

RSpec.describe PostcodeValidator do
  let(:valid_lsoa) { described_class.new('SE17QD') }
  let(:non_servicable_valid_postcode) { described_class.new('TR19 7AA') }
  let(:valid_postcode) { described_class.new('SH24 1AA') }
  let(:invalid_postcode) { described_class.new('blabla') }

  describe '#by_postcode' do
    context 'when the postcode is allowed' do
      it 'returns true if postcode is whitelisted' do
        expect(allowed_lsoa.by_postcode).to eq("Post code is allowed")
      end
    end
  end
end