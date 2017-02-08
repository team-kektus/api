module Example
  module Endpoints
    class Users < Grape::API
      resource :users do
        desc 'List all users'

        get do
          obj = [
            Example::Mockmodels::User.new('Kristjan', 'Puusepp', 'kristjan@example.com'),
            Example::Mockmodels::User.new('Silver', 'Liivamägi', 'silver@example.com'),
            Example::Mockmodels::User.new('Markus', 'Peterson', 'markus@example.com')
          ]
          present obj, with: Example::Entities::User
        end

      end
    end
  end
end
