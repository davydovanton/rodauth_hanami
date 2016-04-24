module Web::Controllers::Pages
  class Index
    include Web::Action

    def call(params)
    end

  private

    def authenticate!
      false
    end
  end
end
