require 'pp'

require_relative 'util.rb'

class NatreeParser < ParserHelpers
  # Enumerable#reduce(:method_name) calls method_name() on all arguments to
  # reduce it; e.g., (5..10).reduce(:+) gets us 45
  rule(:natree) do
    # root node (for future extension)
    str("ROOT") >> newline >> newline >>
      # list of node/attachment chains
      (na_chain >> newline).as(:na_chain).repeat(1).as(:na_chains) >>
      # render call chain
      str("RENDER") >>
      (str(" ") >> chain_root_name).as(:render_atom).repeat(1).as(:render_chain)
  end

  rule(:chain_root_name) do
    match('[^\\s]').repeat(1).as(:name)
  end

  rule(:na_chain) do
    chain_root_name >> newline >>
      ((str("n") | str("a")).as(:na_key) >>
        bson_object_id.as(:oid) >> newline).repeat(1).as(:oids)
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

class NatreeParserTransform < Parslet::Transform
  rule(render_atom: simple(:x)) do
    String(x)
  end
  rule(name: simple(:x)) do
    String(x)
  end
  rule(na_chain: subtree(:chain)) do
    x = chain[:oids].map do |oid_hash|
      [String(oid_hash[:na_key]), String(oid_hash[:oid])]
    end
    {name: String(chain[:name]), oids: x}
  end
end
