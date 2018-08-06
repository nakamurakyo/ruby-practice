require 'csv'

filename = 'csv_sample.csv'

# ============================================
p '====== Read line by line ====='
CSV.foreach(filename) do |row|
  p row
end

# ============================================
p '====== Read only one column ====='
CSV.foreach(filename) do |row|
  p row[0]
end

# ============================================
p '====== Read csv of character string ====='
CSV.parse('firstname,lastname,mailaddress,password') do |row|
  puts row
end

# ============================================
p '====== Read the entire CSV ====='
p CSV.read(filename)

# ============================================
p '====== Write to CSV ====='
CSV.open("write-sample.csv", "w") do |test|
  test << ["write test", "success"]
  test << ["string", "hello world!!"]
end

# ============================================
p '====== Convert to CSV format ====='
headers = ["language","product"]
rows = [["ruby","web_application"], ["python", "AI"], ["java", "business_application"]]
csv_data = CSV.generate() do |csv|
  csv << headers
  rows.each do |row|
    csv << row
  end
end
p csv_data

# ============================================
p '====== Dealing with loading errors ====='
CSV.foreach(filename).with_index(1) do |row, lineno|
  begin
    puts row[0].gsub("a", "b")
  rescue
    raise $!, "#{filename} の #{lineno} 行目を処理中にエラーが発生しました。\n#{$!.message}", $!.backtrace
  end
end