class User < ApplicationRecord
    has_one :workout, dependent: :destroy
    has_secure_password
end
