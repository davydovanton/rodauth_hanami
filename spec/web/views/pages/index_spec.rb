require_relative '../../../spec_helper'
require_relative '../../../../apps/web/views/pages/index'

describe Web::Views::Pages::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/pages/index.html.erb') }
  let(:view)      { Web::Views::Pages::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
