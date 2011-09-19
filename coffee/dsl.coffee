headings = []

class H1
   lastHeading:0
   constructor: (data) ->
      @sub = []
      @text = data.text
      @rows = data.rows
      @rows ?= 1
      H1::lastHeading = this 
   dump: -> 
      s = ""
      s += "\n>" + a.dump() for a in @sub
      "\n"+@text+":"+@rows+s+"\n"

h1 = (text,params = {}) -> 
   params.text = text
   ret = new H1 params
   headings.push ret
   ret

class H2
   lastSubHeading:0
   constructor: (data) ->
      @sub = []
      @text = data.text
      @rows = data.rows
      @rows ?= 1
      H2::lastSubHeading = this 
   dump: -> 
      s = ""
      s += a.dump() for a in @sub
      @text+":"+@rows+"\n"+s

h2 = (text,params = {}) -> 
   params.text = text
   ret = new H2 params
   H1::lastHeading.sub.push ret
   ret

class Card
   constructor: (data) ->
      @text = data.text
      @width = data.width
      @width ?= 100
   dump: -> ">>>"+@text+":"+@width+"\n"

card = (text,params = {}) -> 
   params.text = text
   ret = new Card params
   H2::lastSubHeading.sub.push ret
   ret

class Youtube extends Card
   constructor: (data) -> super(data)

youtube = (text,params = {}) -> 
   params.text = text
   ret = new Youtube params
   H2::lastSubHeading.sub.push ret
   ret

h1 "Simple Text"

h2 "Very Long Text"
card "boo"
card "foo"
youtube "youuuuu"
   width:50

h2 "Very Very Long Text"
   rows:2

h1 "Simple Text2"

h2 "Very Long Text2"

h2 "Very Very Long Text2"
   rows:5

alert [h.dump() for h in headings].join()