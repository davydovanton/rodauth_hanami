module Web::Controllers::Pages
  class Index
    include Web::Action

    expose :rodauth

    def call(params)
      @rodauth = rodauth
    end

  private

    def authenticate!
      false
    end
  end
end
