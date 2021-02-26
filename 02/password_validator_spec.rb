$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'rspec'
require 'password_validator'

describe PasswordValidator do
    it 'parses a text input into a validation condition and a password' do
        password_1 = PasswordValidator.new("1-3 a: abcde")
        expect(password_1.condition).to eq Hash["char" => "a", "min" => 1, "max" => 3]
        expect(password_1.password).to eq "abcde"
        password_2 = PasswordValidator.new("1-3 b: cdefg")
        expect(password_2.condition).to eq Hash["char" => "b", "min" => 1, "max" => 3]
        expect(password_2.password).to eq "cdefg"
    end

    it 'validates that the password contains between the minimum and maximum amount of the specified char' do
        expect(PasswordValidator.new("1-3 a: abcde").validate).to eq true
        expect(PasswordValidator.new("1-3 b: cdefg").validate).to eq false
        expect(PasswordValidator.new("2-9 c: ccccccccc").validate).to eq true
    end

    it 'validates that a character appears exactly one of the specified positions' do
        expect(PasswordValidator.new("1-3 a: abcde").validate_pos).to eq true
        expect(PasswordValidator.new("1-3 b: cdefg").validate_pos).to eq false
        expect(PasswordValidator.new("2-9 c: ccccccccc").validate_pos).to eq false
        expect(PasswordValidator.new("3-5 d: aaeadaerdfde").validate_pos).to eq true
    end
end