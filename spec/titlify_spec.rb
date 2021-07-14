require 'spec_helper'

describe Titlify do
  it "titlecases a string object not in place" do
    title = "this is the title of the post"
    new_title = title.titlify
    title.should eq("this is the title of the post")
    new_title.should eq("This Is the Title of the Post")
  end

  it "titlecases a string object in place" do
    title = "this is the title of the post"
    title.titlify!
    title.should eq("This Is the Title of the Post")
  end

  it "properly titlecases a mixed-case word" do
    title = "the iPhone is the bestest phone".titlify
    title.should eq("The iPhone Is the Bestest Phone")
  end

  it "properly titlecases a word with abbreviations with and without periods" do
    title = "there's a big AT&T monster in DOD for the DOJ".titlify
    title.should eq("There's a Big AT&T Monster in DOD for the DOJ")
    title = "there's a big AT&T monster in d.o.d. for the n.a.s.a.".titlify
    title.should eq("There's a Big AT&T Monster in DOD for the NASA")
  end

  it "capitalizes the first letter after a hyphen" do
    title = "that shit-faced guy fell over the curb".titlify
    title.should eq("That Shit-Faced Guy Fell over the Curb")
  end

  it "capitalizes the first word following a colon" do
    title = "the big guns: a little man's tale".titlify
    title.should eq("The Big Guns: A Little Man's Tale")
  end

  it "capitalizes words that begin with small words" do
    # Without punctuation
    title = "another ardvark used a thesaurus in overgrowth".titlify
    title.should eq("Another Ardvark Used a Thesaurus in Overgrowth")
  end

  it "capitalizes the first letter when '/' is used" do
    title = "this is a cat/dog thing".titlify
    title.should eq("This Is a Cat/Dog Thing")
  end

  it "capitalizes the New York Times correctly" do
    title = "the new york times prints a newspaper".titlify
    title.should eq("The New York Times Prints a Newspaper")
  end

  it "capitalizes words in quotes correctly" do
    title = 'the "best" are in the cards'.titlify
    title.should eq('The "Best" Are in the Cards')
    title = 'sometimes "more than one thing ends up in quotes" and stuff'.titlify
    title.should eq('Sometimes "More than One Thing Ends up in Quotes" and Stuff')
  end

  it "keeps domain names in lowercase n stuff" do
    # With HTTP
    title = "look at http://www.wikipedia.org sometime".titlify
    title.should eq("Look at http://www.wikipedia.org Sometime")

    # With www, without HTTP
    title = "look at www.wikipedia.org sometime".titlify
    title.should eq("Look at www.wikipedia.org Sometime")

    # Without www and HTTP
    title = "look at en.wikipedia.org sometime".titlify
    title.should eq("Look at en.wikipedia.org Sometime")

    title = "look at wikipedia.org sometime".titlify
    title.should eq("Look at wikipedia.org Sometime")

    title = "look at wikipedia.co.uk sometime".titlify
    title.should eq("Look at wikipedia.co.uk Sometime")
  end
end
