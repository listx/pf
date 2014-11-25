TEXT_BASIC = %w[raw-monospaced flushleft flushright centered justified]
TEXT_FILTERED = %w[markdown pandoc]
# plaintext: monospaced, without any formatting (as if you opened it in a text editor, NOT a word processor)
TEXT_TYPES_HASH = Hash[
  (TEXT_BASIC + TEXT_FILTERED).zip(0.step).map(&:reverse)
  ]

IMAGE_TYPES = %w[gif jpg png]
MOVIE_TYPES = %w[avi mpg mpeg mkv ogv]
SOUND_TYPES = %w[mpg ogg flac]
BINARY_TYPES_HASH = Hash[
  (["unknown"] + IMAGE_TYPES + SOUND_TYPES + MOVIE_TYPES)\
  .zip(0.step).map(&:reverse)
  ]
