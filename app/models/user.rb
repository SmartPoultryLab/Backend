class User < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_secure_password
    validates :email, presence: true
    validates_uniqueness_of :email
end
