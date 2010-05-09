class Entry

  attr_accessor :ip, :name
  attr :latencies

  def initialize(ip, name = '')
    raise ArgumentError, 'Not an IP Address' if not ip.is_a? String
    raise ArgumentError, 'Not an Full Qualified Domain-Name' if not name.is_a? String

    @ip = ip
    @name = name
    refresh_latencies
  end

  def refresh_latencies()
    # extract latencies from ping system command
    latencies_keys = 
      `ping -c 4 #{@ip} | grep rtt | awk '{ print $2 }'`.gsub(/\n/, '').split('/').map { |s| s.to_sym }
    latencies_values = 
      `ping -c 4 #{@ip} | grep rtt | awk '{ print $4 }'`.gsub(/\n/, '').split('/').map { |s| s.to_f }

    latencies = latencies_keys.zip(latencies_values).flatten
    @latencies = Hash[*latencies]
  end

end
