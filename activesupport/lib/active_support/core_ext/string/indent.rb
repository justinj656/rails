class String
  # Same as +indent+, except it indents the receiver in-place.
  #
  # Returns the indented string, or +nil+ if there was nothing to indent.
  def indent!(amount, indent_string=nil, indent_empty_lines=false)
    indent_string = indent_string || self[/^[ \t]/] || ' '
    re = indent_empty_lines ? /^/ : /^(?!$)/ # JJ: (?!), negative lookahead
    gsub!(re, indent_string * amount)
  end

  # Indents the lines in the receiver:
  #
  #   <<EOS.indent(2) # TIP: specail usage
  #   def some_method
  #     some_code
  #   end
  #   EOS
  #   # =>
  #     def some_method
  #       some_code
  #     end
  #
  # The second argument, +indent_string+, specifies which indent string to
  # use. The default is +nil+, which tells the method to make a guess by
  # peeking at the first indented line, and fallback to a space if there is
  # none.
  #
  #   "  foo".indent(2)        # => "    foo"
  #   "foo\n\t\tbar".indent(2) # => "\t\tfoo\n\t\t\t\tbar"
  #   "foo".indent(2, "\t")    # => "\t\tfoo"
  #
  # While +indent_string+ is typically one space or tab, it may be any string.
  #
  # The third argument, +indent_empty_lines+, is a flag that says whether
  # empty lines should be indented. Default is false.
  #
  #   "foo\n\nbar".indent(2)            # => "  foo\n\n  bar"
  #   "foo\n\nbar".indent(2, nil, true) # => "  foo\n  \n  bar"
  #
  def indent(amount, indent_string=nil, indent_empty_lines=false)
    dup.tap {|_| _.indent!(amount, indent_string, indent_empty_lines)}
  end
end

# JJ ---
# obj.tap{|x|...} → obj
# Yields self to the block, and then returns self. The primary purpose of this method is to “tap into” a method chain, in order to perform operations on intermediate results within the chain.
# str.gsub!, do not always return the receiver, that is, return nil when no substitution happens.
