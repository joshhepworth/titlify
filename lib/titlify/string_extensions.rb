# encoding: UTF-8

module Titlify

  module StringExtensions
    def self.included(base)
      Titlify.methods(false).each do |method|
        eval("def #{method}(*args, &block); Titlify.#{method}(self.clone, *args, &block); end")
        eval("def #{method}!(*args, &block); replace Titlify.#{method}(self, *args, &block); end")
      end
    end
  end

end


class String
  include Titlify::StringExtensions
end
