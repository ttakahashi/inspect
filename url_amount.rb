class Url_amount
  def push(url)
    @data = Hash.new unless @data
    
    if @data.key?(url) then
      @data[url] += 1
    else
      @data[url] = 1
    end
  end
  
  def pull
    @data
  end
end