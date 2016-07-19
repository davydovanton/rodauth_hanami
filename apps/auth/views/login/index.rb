require_relative '../application_layout'

module Auth
  module Views
    module Login
      class Index
        include Hanami::View
        layout :application
      end
    end
  end
end
