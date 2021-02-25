class ExpenseReport
    def initialize entries
        @entries = entries
    end

    def validate(checksum, depth: 2, entries: @entries)
        if depth == 2 
            entries.each do |entry|
                target = checksum - entry
                return [entry, target] if entries.include? target    
            end
        else 
            head = entries.first
            tail = entries[1..-1]
            result = validate(checksum-head, depth: depth-1, entries: tail)
            if result
                return result << head
            else
                return validate(checksum, depth: depth, entries: tail)
            end
        end
        return false
    end
end