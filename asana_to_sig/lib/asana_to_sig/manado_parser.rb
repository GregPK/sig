module AsanaToSig
  class ManadoParser
    
    def initialize(str)
      @str = str
    end
    
    def parsing_methods
      [
        :long_notation,
        :short_notation,
      ]
    end

    def parse
      res = nil
      parsing_methods.each do |pm|
        res = send(pm)
        break unless res.nil?
      end
      res
    end

    def long_notation
      parse_regexp_notation('manado:[\s]*([\d]+)')
    end
    
    def short_notation
      parse_regexp_notation('\^([\d]+)\^')
    end

    private 
    
    def parse_regexp_notation(re)
      regexp = Regexp.new(re,Regexp::IGNORECASE | Regexp::MULTILINE)
      matches = @str.match(regexp)
      if matches
        matches[1].to_i
      else
        nil
      end
    end
    
  end
end