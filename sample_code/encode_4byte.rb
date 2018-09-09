def encode_4byte_characters(str)
  str.gsub(/[^\u{0}-\u{FFFF}]/) { '&#x%X;' % $&.ord }
end
def decode_4byte_characters(str)
  str.gsub(/&#(x(([0-9a-fA-F]{5,6}))|\d{5,7});/) {
    (defined?($2) ? $2.to_i(16): $1.to_i(10)).chr('UTF-8')
  }
end

puts test1 =  encode_4byte_characters('🍣と🍺')
puts test2 =  encode_4byte_characters('🤡と🤯')
puts '============================='
puts decode_4byte_characters(test1)
puts decode_4byte_characters(test2)















