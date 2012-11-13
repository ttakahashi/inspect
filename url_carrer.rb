class Url_carrer
  def push(url, carrer)
    @data = Hash.new unless @data
    @data[url] = Hash.new unless @data.key?(url)
    
    if @data[url].key?(carrer)
      @data[url][carrer] += 1
    else
      @data[url][carrer] = 1
    end
  end

  def pull
    ret = Array.new
    @data.each{|url, chash|
      chash.each{|carrer, cnt|
        ret << [url, carrer, cnt]
      }
    }
    return ret
  end
end
