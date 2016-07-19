module Web::Controllers::Pages
  class Index
    include Web::Action

    expose :rodauth

    def call(params)
      @rodauth = rodauth

      # => [200, {"ENV"}, 'body']
    end

  private

    def authenticate!
      false
    end
  end
end
