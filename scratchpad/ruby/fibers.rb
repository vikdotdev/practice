f = Fiber.new do
  puts 1
  Fiber.yield
  puts 2
end

f.resume

# non_ascii_string = [some_ascii, some_unicode, more_ascii, invalid_byte].join
non_ascii_string = "\xEF\xBB\xBFhello"

encoding_options = {
  :invalid           => :replace,  # Replace invalid byte sequences
  :undef             => :replace,  # Replace anything not defined in ASCII
  :replace           => '',        # Use a blank for those replacements
  :universal_newline => true       # Always break lines with \n
}

ascii = non_ascii_string.encode(Encoding.find('ASCII'), encoding_options)
ascii = non_ascii_string.encode(Encoding.find('UTF-8'), encoding_options)
non_ascii_string.chars
ascii.chars
