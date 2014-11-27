TEXT_BASIC = %w[raw-monospaced flushleft flushright centered justified]
TEXT_FILTERED = %w[markdown pandoc]
# plaintext: monospaced, without any formatting (as if you opened it in a text editor, NOT a word processor)
TEXT_TYPES_HASH = Hash[
  (TEXT_BASIC + TEXT_FILTERED).zip(0.step).map(&:reverse)
  ]

def prepends(xs, parent_sym)
  xs.map {|x| "#{parent_sym.to_s}/#{x}"}
end

IMAGE_TYPES = prepends(%w[gif jpeg png], :image)
MOVIE_TYPES = %w[avi mpg mpeg mkv ogv]
SOUND_TYPES = %w[mpg ogg flac]
DOCUMENT_TYPES = prepends(%w[pdf], :application)
BINARY_TYPES_HASH = Hash[
  (["unknown"] + IMAGE_TYPES + SOUND_TYPES + MOVIE_TYPES + DOCUMENT_TYPES)\
  .zip(0.step).map(&:reverse)\
  ]

FILE_MODEL_HASH = {'journal' => Journal, 'attachment' => Attachment}
