class Carrer_amount
  def push(carrer)
    @data = Hash.new unless @data

    if @data[carrer] then
      @data[carrer] += 1
    else
      @data[carrer] = 1
    end
  end

  def pull
    return @data
  end
end
