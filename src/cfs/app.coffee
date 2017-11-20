###
# app.coffee
# @author Sidharth Mishra
# @description An example implementation of the same
# @created Sun Nov 19 2017 23:35:06 GMT-0800 (PST)
# @last-modified Sun Nov 19 2017 23:35:06 GMT-0800 (PST)
###

import * as cedux from './index'


# myReducer
myReducer = (state, action) ->
  if action? and action.type?
    console.log "Action type: #{action.type}"
    switch action.type 
      when 'fd' then 100
      when 'rt' then 90
      else 50



Store = cedux.cedux().createStore myReducer, 0

Store.dispatch {type:'fd'}

console.log()
console.log Store.getCurrentState()

Store.dispatch {type:'rt'}

console.log()
console.log Store.getCurrentState()

Store.dispatch {type:'I dunno Action'}

console.log()
console.log Store.getCurrentState()

console.log("State Tree")
console.log Store.getStateTree()
