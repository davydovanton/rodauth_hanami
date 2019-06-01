require_relative '../../../spec_helper'
require_relative '../../../../apps/admin/controllers/dashboard/index'

describe Admin::Controllers::Dashboard::Index do
  let(:action) { Admin::Controllers::Dashboard::Index.new }
  let(:params) { Hash[] }

  it 'redirects unauthorized user' do
    response = action.call(params)
    expect(response[0]).to eq 302
  end
end
