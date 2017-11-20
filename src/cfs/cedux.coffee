###
# cedux.coffee
# @author Sidharth Mishra - sidmishraw
# @description A minimal redux clone in coffeescript
# @created Sun Nov 19 2017 23:05:43 GMT-0800 (PST)
# @last-modified Sun Nov 19 2017 23:05:43 GMT-0800 (PST)
###

#===========================================================#
#       /𝞝𝞝𝞝𝞝𝞝𝞝𝞝𝞝𝞝/                                        #
#      /𝞝𝞝𝞝𝞝𝞝𝞝𝞝𝞝𝞝/                                         #
#     /𝞝𝞝/                                                  #
#    /𝞝𝞝/        edux                                       #
#   /𝞝𝞝𝞝𝞝𝞝𝞝𝞝𝞝𝞝/                                            #
#  /𝞝𝞝𝞝𝞝𝞝𝞝𝞝𝞝𝞝/                                             #
#===========================================================#

export cedux = ->
  do(Store = undefined, cedux = undefined) ->
    
    Store = {
      updateCount:0,
      stateTree:{},
      state: null,
      reducer: null
    }
    
    cedux =
      
      # createStore
      #~~~~~~~~~~~~~~~~
      # @param reducer - The reducer is a pure function that takes in an action and the current state
      # of the Store and returns a new state for the store
      # The reducer is of the form `(state, action) -> state`
      #
      # @param initialState - The initial state of the Store.
      #
      createStore: (reducer, initialState) ->
        Store.reducer = reducer
        Store.state = initialState
        cedux

      # dispatch
      #~~~~~~~~~~~~
      # This function acts as dispatcher. It dispatches the incoming actions.
      # The incoming action is passed through the reducer. The reducer computes and updates the
      # state of the Store.
      # 
      # @param incomingAction - The incoming action to the dispatcher.
      #
      dispatch: (incomingAction) ->
        Store.updateCount += 1
        Store.stateTree["StateKey: #{Store.updateCount}"] = Store.state # push it into the state tree
        Store.state = Store.reducer Store.state, incomingAction # compute the action from currentState and incomingAction
        incomingAction
      
      # getCurrentState
      #~~~~~~~~~~~~~~~~~
      # Fetches the current state of the Store
      #
      getCurrentState: ->
        Store.state
      
      # getStateTree
      #~~~~~~~~~~~~~~~
      # Fetches the state history tree
      getStateTree: ->
        Store.stateTree

      

        
      
  
  