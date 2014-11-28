require 'pp'

require_relative 'util.rb'

class NatreeParser < ParserHelpers
  # Enumerable#reduce(:method_name) calls method_name() on all arguments to
  # reduce it; e.g., (5..10).reduce(:+) gets us 45
  rule(:natree) do
    # root node (for future extension)
    str("ROOT") >> newline >> newline >>
      # list of node/attachment chains
      (nachain >> newline).as(:nachain).repeat(1) >>
      # render call chain
      str("RENDER") >>
      (str(" ") >> chain_root_name).as(:render_atom).repeat(1) >>
      # special last newline, as inserted by Vim/Emacs
      newline
  end

  rule(:chain_root_name) do
    match('[^\\s]').repeat(1).as(:name)
  end

  rule(:nachain) do
    chain_root_name >> newline >>
      (bson_object_id >> newline).as(:oid).repeat(1)
  end

  # MongoDB's ObjectId type is a 12-byte type. We need exactly 24 hex digits to
  # represent it.
  rule(:bson_object_id) do
    match('\h').repeat(24,24)
  end

  # Specify master rule to start parsing from.
  root(:natree)
end

def parse_natree(str)
  parser = NatreeParser.new

  parser.parse(str)
  rescue Parslet::ParseFailed => failure
    puts failure.cause.ascii_tree
end
#	NatreeParserTransform.new.apply(parse_natree(INPUT_STRING))

class NatreeParserTransform < Parslet::Transform
	rule(name: simple(:x)) do
		String(x)
	end
end
