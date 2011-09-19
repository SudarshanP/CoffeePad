headings = []
lastHeading = 0
out = this;
class H1
   constructor: (data) ->
      @text = data.text
      @rows = data.rows
      @rows ?= 1 
   dump: -> @text+":"+@rows

h1 = (text,params = {}) -> 
   params.text = text
   out.lastHeading = new H1 params
   headings.push out.lastHeading
   out.lastHeading

h1 "Simple Text"

h1 "Very Long Text"

h1 "Very Very Long Text"
   rows:2

alert lastHeading.dump()
