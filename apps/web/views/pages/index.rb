module Web::Views::Pages
  class Index
    include Web::View

    def current_email
      AccountRepository.find(rodauth.session_value).email
    end
  end
end
