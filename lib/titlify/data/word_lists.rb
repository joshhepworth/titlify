# encoding: utf-8

module Titlify
  class Data
    def self.articles
      %w(a an the some)
    end

    def self.coordinating_conjunctions
      %w(and but or nor for yet so)
    end

    def self.prepositions
      %w(a abaft aboard about above absent across afore after against along alongside amid amidst among amongst an apropos around as aside astride athwart atop barring before behind below beneath beside besides between betwixt beyond but by circa concerning despite down during except excluding failing following for from given in including inside into lest like mid midst minus modulo near next notwithstanding of off on onto opposite out outside over pace past per plus pro qua regarding round sans save since than through throughout till to toward towards under underneath unlike until up upon versus via vice with within without worth)

      # Not included because same spelling is more commonly a different part of speech
      # times

      # Included in special cases
      # at
    end

    def self.special_cases
      # I bet this is going to get out of control...
      %w(at(?!&t) v[.]? vs[.]?)
    end

    def self.word_list
      Data.articles | Data.coordinating_conjunctions | Data.prepositions | Data.special_cases
    end
  end
end
