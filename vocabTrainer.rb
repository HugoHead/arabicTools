require "tty-reader"
$windows = false
if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  require 'win32/sound'
  include Win32
  $windows = true
end

def playSound file
  if $windows
      Sound.play(file, Sound::ALIAS)
  else
      system("aplay #{file}")
  end
end

audioFilList = ARGV
audioFileList = audioFilList.shuffle
audioFilList.each do |wordAudioFile|
	playSound(wordAudioFile)
	puts "What word was just said?"
	response = gets.chomp("\n")
	puts response == "ا"
end
