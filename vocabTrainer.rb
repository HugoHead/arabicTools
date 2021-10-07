 def OS.windows?
   (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
 end

 def OS.mac?
  (/darwin/ =~ RUBY_PLATFORM) != nil
 end

 def OS.unix?
   !OS.windows?
 end

 def OS.linux?
   OS.unix? and not OS.mac?
 end

 def OS.jruby?
   RUBY_ENGINE == 'jruby'
 end

#
#
# gem install win32-sound
require "tty-reader"

if OS.windows?
  require 'win32/sound'
  include Win32
end


audioFilList = ARGV
audioFileList = audioFilList.shuffle
audioFilList.each do |wordAudioFile|
	Sound.play(wordAudioFile, Sound::ALIAS)
	puts "What word was just said?"
	response = gets.chomp("\n")
	puts response == "ا"
end
