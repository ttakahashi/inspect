class Url_by_day
  def push(day,url)
    @data = Hash.new unless @data
    @data[day] = Hash.new unless @data.key?(day)

    if @data[day].key?(url)
       @data[day][url] += 1
    else
       @data[day][url] = 1
    end  
  end

  def pull
    ret = Array.new
    @data.each{|day,dhash|
      dhash.each{|url,cnt|
        ret << [day,url,cnt]
      }
    }
    return ret
  end
end