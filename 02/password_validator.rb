class PasswordValidator
    def initialize password_entry
        parse password_entry
    end

    def parse entry
        (condition_string, password) = entry.split(":")
        @condition = parse_condition condition_string
        @password = password.strip
    end

    def parse_condition condition
        (range, char) = condition.split()
        char = char
        (min, max) = range.split("-")
        return Hash["char" => char, "min" => min.to_i, "max" => max.to_i]
    end

    def validate
        occurences = @password.count(condition["char"])
        if (occurences >= condition["min"] && occurences <= condition["max"])
            return true
        else
            return false
        end
    end

    def condition
        @condition
    end

    def password
        @password
    end
end