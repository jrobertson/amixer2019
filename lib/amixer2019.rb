#!/usr/bin/env ruby

# file: amixer2019.rb
# description: A wrapper around the command-line program amixer.


class AMixer2019

  def initialize(notch: 5, fade_interval: 0.15, debug: false)

    @debug = debug
    @notch, @fade_interval = notch, fade_interval
    @control = `amixer scontrols`[/(?<=')[^']+/]
    query(`amixer get '#{@control}'`)

  end

  # fades the volume up or down to the volume percentage

  def fade(raw_val, interval: @fade_interval)

    val = raw_val.to_i
    return 'volume must be between 0 and 100' if val < 0 or val > 100
 
    @volume.method(val > @volume ? :upto : :downto).call(val.to_i).each do |x|
      sleep interval; setvol(x.to_s + '%')
    end

    @volume

  end

  def mute()        sset 'mute'      end
  def muted?()      @muted           end
  def unmute()      sset 'unmute'    end
  def vol_down()    setvol(-@notch)  end
  def vol_up()      setvol(+@notch)  end
  def volume()      @volume          end
  def volume=(val)  setvol(val)      end

  alias vol volume
  alias vol= volume=

  private

  def sset(switch)
    query(`amixer sset '#{@control}' #{switch}`)
  end

  def setvol(val)

    return sset(val) if val.is_a?(String) and val =~ /%$/

    if val.to_i + @volume >= 0 and val.to_i + @volume <= 100 then
      sset("%s%%" % [@volume + val.to_i])
    else
      @volume
    end

  end

  def query(r)

    puts 'r: ' + r.inspect if @debug
    h = r.match(/(?<volume>\d+)%\] .*\[(?<toggle>on|off)\]/)
    @volume = h[:volume].to_i
    @muted = h[:toggle] == 'off'

  end

end
