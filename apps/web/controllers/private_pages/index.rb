module Web::Controllers::PrivatePages
  class Index
    include Web::Action

    def call(params)
      unless rodauth.authenticated?
        redirect_to rodauth.login_route
      end
    end

    def rodauth
      request.env['rodauth']
    end
  end
end
