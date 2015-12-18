def puts_parser_error parser, input
  # TODO look at parser.consume_all_input false
  parser.failure_reason =~ /^(Expected .+) after/m
  STDERR.puts "#{$1.gsub("\n", '$NEWLINE')}:"
  STDERR.puts input.lines.to_a[parser.failure_line - 1]
  STDERR.puts "#{'~' * (parser.failure_column - 1)}^"
end
