# encoding: UTF-8

module Titlify

  class << self

    # Format text appropriately for titles. This method is much smarter
    # than ActiveSupport's +titlecase+. The algorithm is based on work done
    # by John Gruber et al (http://daringfireball.net/2008/08/title_case_update)
    def titlify(string)

      lsquo = [8216].pack("U")
      rsquo = [8217].pack("U")
      ldquo = [8220].pack("U")
      rdquo = [8221].pack("U")
      ndash = [8211].pack("U")

      string.strip!
      string.gsub!(/\s+/, " ")
      string.downcase! unless string =~ /[[:lower:]]/

      small_words = word_list.join("|")
      apos = / (?: ['#{rsquo}] [[:lower:]]* )? /xu

      string.gsub!(
        /
          \b
          ([_\*]*)
          (?:
            ([A-Z][\.]) # Acronyms with periods in them
          ){2,100}
          ([_\*]*)
          \b?
        /xi
      ) do |m|
        m.gsub(/\./, "").upcase
      end

      string.gsub!(
        /
          \b
          ([_\*]*)                                          # [1]
          (?:
            (                                               # [2] entire matched URL
              (?:[A-Za-z0-9]+[\.]{1})+(?:ac|ad|ae|aero|af|ag|ai|al|am|an|ao|aq|ar|arpa|as|asia|at|au|aw|ax|az|ba|bb|bd|be|bf|bg|bh|bi|biz|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cat|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|com|coop|cr|cu|cv|cw|cx|cy|cz|de|dj|dk|dm|do|dz|ec|edu|ee|eg|er|es|et|eu|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gg|gh|gi|gl|gm|gn|gov|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|im|in|info|int|io|iq|ir|is|it|je|jm|jo|jobs|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|me|mg|mh|mil|mk|ml|mm|mn|mo|mobi|mp|mq|mr|ms|mt|mu|museum|mv|mw|mx|my|mz|na|name|nc|ne|net|nf|ng|ni|nl|no|np|nr|nu|nz|om|org|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|pro|ps|pt|pw|py|qa|re|ro|rs|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|st|su|sv|sx|sy|sz|tc|td|tel|tf|tg|th|tj|tk|tl|tm|tn|to|tp|tr|travel|tt|tv|tw|tz|ua|ug|uk|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|xn|xxx|ye|yt|za|zm|zw)
              |
              (?:
                (?:
                  [a-z][\w-]+:
                  (?:
                    \/{1,3}
                    |
                    [a-z0-9%]
                  )
                  |
                  www\d{0,3}[.]
                  |
                  [a-z0-9.\-]+[.][a-z]{2,4}\/
                )
                (?:
                  [^\s()<>]+
                  |
                  \([^\s()<>]+|\([^\s()<>]+\)*\)
                )+
                (?:
                  \([^\s()<>]+|\([^\s()<>]+\)*\)
                  |
                  [^\s`!()\[\]{};:'".,<>?«»“”‘’]
                )
              )
            )
            |
            ((?:[\w-\.]+)@(?:[\w]+\.)+(?:[a-zA-Z]){2,4})        # [3] email
            |
            ( (?i: #{small_words} ) #{apos} )               # [4] or small word, case-insensitive
            |
            ( [[:alpha:]] [[:lower:]'#{rsquo}()\[\]{}]* #{apos} )  # [5] or word without internal caps
            |
            ( [[:alpha:]] [[:alpha:]'#{rsquo}()\[\]{}]* #{apos} )  # [6] or some other word
          )
          ([_\*]*)                                                 # [7]
          \b
        /xu
      ) do
        ($1 ? $1 : "") +
        ($2 ? $2 : ($3 ? $3.downcase : ($4 ? $4.downcase : ($5 ? $5.downcase.capitalize : $6)))) +
        ($7 ? $7 : "")
      end

      if RUBY_VERSION < "1.9.0"
        string.gsub!(
          /
            \b
            ([:alpha:]+)
            (#{ndash})
            ([:alpha:]+)
            \b
          /xu
        ) do
          $1.downcase.capitalize + $2 + $1.downcase.capitalize
        end
      end

      string.gsub!(
        /
          (
            \A [[:punct:]]*     # start of title
            | [:.;?!][ ]+       # or of subsentence
            | [ ]['"#{ldquo}#{lsquo}(\[][ ]*  # or of inserted subphrase
          )
          ( #{small_words} )    # followed by a small-word
          \b
        /xiu
      ) do
        $1 + $2.downcase.capitalize
      end

      string.gsub!(
        /
          \b
          ( #{small_words} )    # small-word
          (?=
            [[:punct:]]* \Z     # at the end of the title
            |
            ['"#{rsquo}#{rdquo})\]] [ ]       # or of an inserted subphrase
          )
        /xu
      ) do
        $1.downcase.capitalize
      end

      string.gsub!(
        /
          (
            \b
            [[:alpha:]]         # single first letter
            [\-#{ndash}]               # followed by a dash
          )
          ( [[:alpha:]] )       # followed by a letter
        /xu
      ) do
        $1 + $2.downcase
      end

      string.gsub!(/q&a/i, 'Q&A')

      string
    end
    alias_method :titlecase, :titlify


    private

    # Lazy load smart formatting rules
    def smart_format_rules
      @smart_format_rules ||= begin
                                require "titlify/data/smart_format_rules"
                                Data.smart_format_rules
                              end
    end

    def word_list
      @word_list ||= begin
                       require "titlify/data/word_lists"
                       Data.word_list
                     end
    end

  end
end
