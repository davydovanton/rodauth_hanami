require_relative '../application_layout'

module Auth
  module Views
    module Logout
      class Index
        include Hanami::View
        layout :application
      end
    end
  end
end
