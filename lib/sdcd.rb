# frozen_string_literal: true

require_relative "sdcd/version"

class FormatError < IOError;end

def rot47(data, iter = 47)
  tmp_value = ''
  data.bytes.map do |c|
    if c > 32 and c < 127
      c += iter
      loop do
        if c > 126
          c = (c - 126)+32
        end
        break if c > 32 and c < 127
      end
    end
    tmp_value += c.chr
  end
  return tmp_value
end

module Sdcd
  class SDCD
    attr_accessor :format,:domain
    def initialize
    end

    def compress(domain, list_subdomain)
      @format = "\x01\xEE5&%&\xEE\xED\x03#{domain.strip}\xFA"
      list_subdomain.map {|e| e.strip}.uniq.map do |s|
        s = s.sub(".#{domain.strip}", "")
        if s != ""
          s+= "\xFA"
          @format += s
        end
      end
      return rot47(@format, 30)
    end

    def decompress(data, tmp = [])
      data = rot47(data, 64).dump
      data = data[1,data.length-2]
      data = data.split('\xFA')
      header = data[0]
      if(header[0,24] == '\x01\xEE5&%&\xEE\xED\x03')
        domain = header.split('\x03')[1]
        subdomain = data[1,data.length-1]
        subdomain.map do |s|
          tmp.append("#{s}.#{domain}")
        end
        result = {}
        result[domain] = tmp
        return result
      else
        raise FormatError::new("Unknown SDCD data")
      end
    end

    def write(file, domain, list_subdomain)
      File.open(file, 'w') do |f|
        return f.write(compress(domain, list_subdomain))
      end
    end

    def read(file)
      File.open(file, 'rb') do |f|
        return decompress(f.read)
      end
    end

  end
end

include Sdcd
