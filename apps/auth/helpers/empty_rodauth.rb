module Auth
  class EmptyRodauth
    DEFAULT_LOGIN_PATH = '/login'.freeze

    def login_route
      DEFAULT_LOGIN_PATH
    end

    def authenticated?
      false
    end

    def account_id
      nil
    end

    def nil?
      true
    end
  end
end
