$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'input'
require 'expense_report'

report = ExpenseReport.new(@input)
(x, y) = report.validate 2020
puts x * y