# gem install win32-sound
require "tty-reader"
require 'win32/sound'

include Win32

audioFilList = ARGV
audioFileList = audioFilList.shuffle
audioFilList.each do |wordAudioFile|
	Sound.play(wordAudioFile, Sound::ALIAS)
	puts "What word was just said?"
	response = gets.chomp("\n")
	puts response == "ا"
end