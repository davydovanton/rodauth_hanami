require 'rubygems'
require 'bundler/setup'
require 'hanami/setup'
require_relative '../lib/rodauth_hanami'
require_relative '../apps/admin/application'
require_relative '../apps/web/application'

Hanami::Container.configure do
  mount Admin::Application, at: '/admin'
  mount Web::Application, at: '/'
end
