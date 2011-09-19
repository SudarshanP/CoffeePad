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
      @text+":"+@rows+s

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
   dump: -> @text+":"+@rows

h2 = (text,params = {}) -> 
   params.text = text
   ret = new H2 params
   H1::lastHeading.sub.push ret
   ret

a = h1 "Simple Text"

h2 "Very Long Text"

h2 "Very Very Long Text"
   rows:2

alert a.dump()