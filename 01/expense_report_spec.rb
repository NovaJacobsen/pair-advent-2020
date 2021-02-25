$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'rspec'
require 'expense_report'

describe ExpenseReport do
    describe :validate do
        it 'finds a pair of numbers that sum to a specified value' do
            report = ExpenseReport.new([1721, 979, 366, 299, 675, 1456])
            expect(report.validate(2020)).to contain_exactly 1721, 299
            expect(report.validate(665)).to contain_exactly 366, 299
        end
    
        it 'takes an optional argument for how many addends to sum' do
            report = ExpenseReport.new([1721, 979, 366, 299, 675, 1456])
            expect(report.validate(2020, depth: 3)).to contain_exactly 979, 366, 675
        end    
    end
end