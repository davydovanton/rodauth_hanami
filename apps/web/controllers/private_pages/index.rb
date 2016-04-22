module Web::Controllers::PrivatePages
  class Index
    include Web::Action

    def call(params)
      rodauth.require_authentication
    end

    def rodauth
      request.env['rodauth']
    end
  end
end
