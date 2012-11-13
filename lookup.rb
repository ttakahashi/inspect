class Lookup
  def carrer(carrer) #キャリア判定　引数:ユーザエージェント　戻り値:キャリア種別
    case 
    when carrer.match(/DoCoMo\//) then
      return "docomo"
    when carrer.match(/KDDI-/) || carrer.match(/UP.Browser/) then
      return "au"
    when carrer.match(/SoftBank\//) || carrer.match(/Vodafone\//) || carrer.match(/MOT-/) then
      return "softbank"
    when carrer.match(/(Safari).*(iPhone OS).*/) || carrer.match(/(iPhone OS).*(Safari).*/) then
      return "iphone"
    when carrer.match(/Android/) then
      return "android"
    when carrer.match(/(Safari).*(iPad).*/) || carrer.match(/(iPad).*(Safari).*/) then
      return "ipad"
    else
      return "pc"
    end
  end
  def initial_value
    return {'docomo'=>0,'au'=>0,'softbank'=>0,'iphone'=>0,'android'=>0,'ipad'=>0,'pc'=>0}
  end
end
