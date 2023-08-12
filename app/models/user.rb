class User < ApplicationRecord
    has_one :workout

    has_secure_password
end
