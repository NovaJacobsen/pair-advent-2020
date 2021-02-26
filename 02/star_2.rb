$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'input'
require 'password_validator'

count = 0

for password in @input
    if PasswordValidator.new(password).validate_pos
        count += 1
    end
end
puts count