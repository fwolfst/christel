#!/usr/bin/env ruby
# Deal with a cpl file.

require 'optparse'

require 'christel'
require 'cpl'

options = {}
opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: #{$0} [OPTIONS] [FILES]"
  opt.separator ""
  opt.separator "OPTIONS"

  opt.on_tail("-h", "--help", "Show this message") do
    puts opt
    puts
    puts "As argument the path to one or more (cpl-)file(s) can be given."
    puts "Alternatively, if none is given, ${0} reads from"
    puts "STDIN until EOF is reached.  Remember that EOF can be given by"
    puts "CTRL+D if STDIN comes via your terminal."
    exit
  end
end

opt_parser.parse!

# Parser automagically created by polyglot and cpl_grammar.treetop
cpl_parser = CPLGrammarParser.new

begin
  input = ARGF.read
rescue
  input = ARGF.filename
end

tree = cpl_parser.parse input
if tree.nil?
  # consider using the logger
  puts_parser_error cpl_parser, input
  exit 1
else
  puts tree.inspect
end
