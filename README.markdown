Titlify
=======

![Codeship Status](https://www.codeship.io/projects/cdf48890-1fa5-0131-140d-76d2c47f2c63/status)

The best damn titlecase function. (Or at least on its way.) Titlify will be moving closer to adhere to the [AP Stylebook](http://www.apstylebook.com/). It is the most commonly used style guide in the United States in journalism. Because I expect this gem will be used in situations more similar to journalism, I think the AP Stylebook makes sense. However, if there's enough support for Chicago Manual of Style and Elements of Typographic Style, I'll reconsider. It's still early on.

Credits
-------
The most thorough titlecasing function I found was Patrick Hogan's in his [sterile gem](https://github.com/pbhogan/sterile). I started with his titlecasing function which was an expansion on John Gruber's Perl titlecasing function.

Usage
-----

Titlify provides functionality both as class methods on the Titlify module and as extensions to the String class. 

    Titlify.config do |c|
      c.stylebook = :apa
    end

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

Install with RubyGems:

    gem install titlify
    
Status
------

[![Code Climate](https://codeclimate.com/github/joshhepworth/titlify.png)](https://codeclimate.com/github/joshhepworth/titlify) [![Build Status](https://travis-ci.org/joshhepworth/titlify.png?branch=master)](https://travis-ci.org/joshhepworth/titlify)

License
-------

__Sterile__

Copyright (c) 2011 Patrick Hogan, released under the MIT License
http://www.opensource.org/licenses/mit-license

__Titlify__

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
