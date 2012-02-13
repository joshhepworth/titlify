require 'spec_helper'

describe Titlify do
  it "titlecases a string object" do
    title = "this is the title of the post".titlify
    title.should eq("This Is the Title of the Post")
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
    title = "there's a big AT&T monster in D.O.D. for the D.O.J.".titlify
    title.should eq("There's a Big AT&T Monster in D.O.D. for the D.O.J.")
  end

  it "capitalizes the first letter after a hyphen" do
    title = "that shit-faced guy fell over the curb".titlify
    title.should eq("That Shit-Faced Guy Fell Over the Curb")
  end

  it "capitalizes the first word following a colon" do
    title = "the big guns: a little man's tale".titlify
    title.should eq("The Big Guns: A Little Man's Tale")
  end
end
