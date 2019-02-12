# Introducing the amixer2019 gem

## Usage

    amixer = AMixer2019.new
    amixer.volume

    sleep 3

    # increase the volume by 5% if volume is less than 96%
    amixer.vol_down

    sleep 3

    # decrease the volume by 5% if volume is greater than 4%
    amixer.vol_up

    amixer.mute
    amixer.muted? #=> true

    sleep 3
    amixer.unmute
    amixer.volume = '55%'

    amixer.fade '70%'


The amixer2019 is a wrapper of the amixer command-line program.

## Resources

* amixer2019 https://rubygems.org/gems/amixer2019

amixer volume set raspberrypi rpi alsamixer
