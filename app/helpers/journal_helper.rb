module JournalHelper
  include ActionView::Helpers::TextHelper

  # Use the '#natree' string to generate a properly-structured HTML-rendered
  # output to store into the database. We could store the AST-like structure
  # of '#natree' in JSON's string representation form, but that involves extra
  # dependencies and overhead that we do not need now.
  def gen_render(natree)
    parsed_hash = parse_natree(natree)
    phash = NatreeParserTransform.new.apply(parsed_hash)
    render_text = ""

    na_chains = phash[:na_chains]
    rchain = phash[:render_chain]

    rchain.each do |chain_name|
      if na_chains.map{|nc| nc[:name]}.include?(chain_name)
        oids = get_oids(chain_name, na_chains)
        render_text << render_oids(oids)
      else
        render_text << "key #{chain_name} not found in `na_chains'\n"
      end
    end

    # Rendered output string
    render_text
  end

  def get_oids(chain_name, na_chains)
    na_chains.find {|chain| chain[:name] == chain_name}[:oids]
  end

  def render_oids(oids)
    output = ""
    oids.each do |obj_type, oid|
      if obj_type == "n"
        output << ">> #{Note.find(oid).text} <<\n\n"
      else
        output << ">> #{Attachment.find(oid).fyle_url} <<\n\n"
      end
    end

    output
  end
end
