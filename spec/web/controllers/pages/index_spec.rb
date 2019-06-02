require_relative '../../../spec_helper'
require_relative '../../../../apps/web/controllers/pages/index'

describe Web::Controllers::Pages::Index do
  let(:action) { Web::Controllers::Pages::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
