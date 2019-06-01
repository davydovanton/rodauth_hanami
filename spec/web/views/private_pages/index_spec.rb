require_relative '../../../spec_helper'
require_relative '../../../../apps/web/views/private_pages/index'

describe Web::Views::PrivatePages::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/private_pages/index.html.erb') }
  let(:view)      { Web::Views::PrivatePages::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
