Titlify
=======

The best damn titlecase function. (Or at least on its way.)

Credits
-------
The most thorough titlecasing function I found was Patrick Hogan's in his [sterile gem](https://github.com/pbhogan/sterile). I started with his titlecasing function and expanded to include some more logic to bring it closer to the AP guidelines and handle more fringe cases.

Usage
-----

Titlify provides functionality both as class methods on the Titlify module and as extensions to the String class. 

    Titlify.titlify("make title") # => "Make Title"

    "make title".titlify # => "Make Title"

    title = "make title"
    title.titlify!
    title # => "Make Title"


Titlecase
---------

Format text appropriately for titles. This method is much smarter than ActiveSupport's titlecase. The algorithm is based on work done by John Gruber et al (http://daringfireball.net/2008/08/title_case_update). It gets closer to the AP standard for title capitalization, including proper support for small words and handles a variety of edge cases.

	"Q&A with Steve Jobs: 'That's what happens in technology'".titlify
	# => "Q&A With Steve Jobs: 'That's What Happens in Technology'"
	
	"Small word at end is nothing to be afraid of".titlify
	# => "Small Word at End Is Nothing to Be Afraid Of"


Installation
------------
__Not Yet Published__

Install with RubyGems:

    gem install titlify

License
-------

Copyright (c) 2012 Josh Hepworth, released under the MIT License.
http://www.opensource.org/licenses/mit-license
