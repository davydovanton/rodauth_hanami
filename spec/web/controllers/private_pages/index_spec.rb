require_relative '../../../spec_helper'
require_relative '../../../../apps/web/controllers/private_pages/index'

describe Web::Controllers::PrivatePages::Index do
  let(:action) { Web::Controllers::PrivatePages::Index.new }
  let(:params) { Hash[] }

  it 'redirects unauthorized user' do
    response = action.call(params)
    expect(response[0]).to eq 302
  end
end
