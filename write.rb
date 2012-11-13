require 'csv'
class Write
  def csv(filename, data)
    CSV.open(filename, "w") { |write_line|
      data.each{|read_line|
        write_line << read_line
      }
    }
  end
end
