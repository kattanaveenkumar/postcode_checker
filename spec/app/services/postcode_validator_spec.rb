# frozen_string_literal: true

require 'rails_helper'
require "faraday"
require "json"
require "oj"

RSpec.describe PostcodeValidator do
  let(:subject_valid_lsoa) { described_class.new('SE17QD') }
  let(:subject_non_servicable_valid_postcode) { described_class.new('TR19 7AA') }
  let(:subject_allowed_postcode) { described_class.new('SH24 1AA') }
  let(:subject_invalid_postcode) { described_class.new('blabla') }

  describe '#initialize' do
    it 'remove spaces from postcode' do
      expect(subject_valid_lsoa.postcode).to eq('se17qd')
    end
  end
  describe '#call' do
    context 'when the postcode is allowed' do
      it 'returns /Post code is allowed/ if postcode is allowed' do
        expect(subject_valid_lsoa.call).to eq("Post code is allowed")
      end
    end

    context 'Some postcodes are unknown by the API or may be served despite being outside of the allowed LSOAs.' do
      it 'returns /Post code is allowed/ if postcode is in allowed list' do
        expect(subject_allowed_postcode.call).to eq("Post code is allowed")
      end
    end

    context 'when the postcode is invalid' do
      it 'returns true if postcode is whitelisted' do
        expect(subject_invalid_postcode.call).to eq("Invalid postcode")
      end
    end

    context 'when the postcode is valid but not serviceable' do
      it 'returns Invalid postcode' do
        expect(subject_invalid_postcode.call).to eq("Invalid postcode")
      end
    end
  end
end