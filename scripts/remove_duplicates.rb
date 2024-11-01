require 'csv'

# Check if the correct number of arguments were provided
if ARGV.length != 1
  puts 'Usage: ruby remove_duplicates.rb <path_to_csv_file>'
  exit
end

# Get the path to the CSV file from the command-line argument
file_path = ARGV[0]

begin
  # Read CSV file
  data = CSV.read(file_path, headers: true)

  # Convert CSV data to an array of hashes
  rows = data.map(&:to_hash)

  # Remove duplicates based on the entire row
  unique_rows = rows.uniq

  # Write the unique rows back to the CSV file
  CSV.open(file_path, 'w') do |csv|
    csv << data.headers  # Write headers
    unique_rows.each do |row|
      csv << row.values
    end
  end

  puts "Duplicates removed successfully from #{file_path}!"
rescue Errno::ENOENT
  puts "File not found: #{file_path}"
  exit
rescue CSV::MalformedCSVError => e
  puts "CSV Error: #{e.message}"
  exit
end