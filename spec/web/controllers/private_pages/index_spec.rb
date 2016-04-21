require 'spec_helper'
require_relative '../../../../apps/web/controllers/private_pages/index'

describe Web::Controllers::PrivatePages::Index do
  let(:action) { Web::Controllers::PrivatePages::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
