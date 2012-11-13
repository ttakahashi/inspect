require 'tempfile'
class Util
  def linedelete(filename, num_of_lines)
    temp = Tempfile.new(filename + "temp", File.dirname(filename))
    file = File.open(filename)
    linenum = 1
    file.each{|line|
      temp.write(line) unless file.lineno == num_of_lines
      linenum += 1
    }
    temp.close
    mode = File.stat(filename).mode
    File.rename(temp.path, filename)
    File.chmod(mode, filename)
  end
end
