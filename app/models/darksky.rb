class Darksky

  def initialize
    response = HTTParty.get("https://api.darksky.net/forecast/#{ENV["DARK_SKY_SECRET"]}/37.8108,-122.3554")
    @json = JSON.parse(response.body)
  end

  def latitude
    @lat =@json['latitude']
  end

  def longitude
    @lon = @json['longitude']
  end

  def timezone
    @tz = @json['timezone']
  end

  def now
    @now_summary = @json['minutely']['summary']
  end

  def now_icon
    @now_icon = @json['minutely']['icon']
    @now_icon.gsub!("-", "_")
    @now_icon.upcase!
  end

  def hourly_data
    @now_temp =@json['hourly']['data']
  end

  def week
    @week_summary = @json['daily']['summary']
  end

  def week_icon
    @week_icon = @json['daily']['icon']
  end

  def week_data
    @week_cond= [ ]
    @json['daily']['data'].each do |d|
      @week_cond << d
    end
    return @week_cond
  end

end
