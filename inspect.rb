require 'zlib'
require 'date'
require 'url_by_day'
require 'url_amount'
require 'url_carrer'
require 'lookup'
require 'carrer_amount'
require 'write'
currentdir = Dir::pwd
dirpath = currentdir + '/HOSTNAME/'
ubd = Url_by_day.new
uam = Url_amount.new
uca = Url_carrer.new
cam = Carrer_amount.new
lookup = Lookup.new
write = Write.new

Dir::entries(dirpath).each {|filename|
  next if filename == '..' || filename == '.'
  puts "searching for #{filename}..."
  target = File.open("target", "w")
  target = File.open(dirpath + filename)
  gz = Zlib::GzipReader.new(target)
  Zlib::GzipReader.open(dirpath + filename).each {|line|
    m = line.match(%r(^([^ ]*) ([^ ]*) ([^ ]*) \[(.+)\] \"(.*)\ \"(.*)\" \"(.*)\"))
    unless m[6].include?('HOSTNAME') || m[6] == "-" then
      begin
        day = Date.parse(m[4]).strftime('%Y-%m-%d')
        #rurl = m[6].scan(/(s?https?:\/\/.*?)\?/)
        rurl = m[6].scan(/^([^?;]*)/)
        #p rurl
=begin
        rurl = m[6].scan(/s?https?:\/\/.*?\//)
        if rurl == "" then
          rurl = m[6].scan(/(s?https?:\/\/.*?)\?/)
        end
=end

        rurl = m[6] if rurl.length <= 0
        carrer = lookup.carrer(m[7])
        ubd.push(day,rurl)
        uam.push(rurl)
        uca.push(rurl,carrer)
        cam.push(carrer)
      rescue Exception => e
       p e
     end
   end
  }
}
p "--------URL BY DAY--------"
p ubd.pull
write.csv("url_by_day.csv", ubd.pull)
p "--------URL AMOUNT--------"
p uam.pull
write.csv("url_amount.csv", uam.pull)
p "--------URL CARRER--------"
p uca.pull
write.csv("url_carrer.csv", uca.pull)
p "--------CARRER AMOUNT--------"
p cam.pull
write.csv("carrer_amount.csv", cam.pull)

File.unlink("target")
