import { ADD_FRUIT, CLEAR_FRUIT, ADD_APPLE, ADD_ORANGE } from './actions';

//define default application state: an empty basket or array
const _defaultState = {
  fruits: []
};

//not going to have an old state or action the first time you run
//the reducer function
const reducer = (oldState = _defaultState,action) =>{
  switch(action.type){
    case ADD_FRUIT:
      return {
        //concatenate oldstate fruits with new fruit from the new action
        //returns a brand new object so the old state is not mutated
        fruits: [...oldState.fruits, action.fruit]

      };
    case ADD_APPLE:
      return {
        fruits: [...oldState.fruits,action.fruit]
      };
    case ADD_ORANGE:
      return{
        fruits: [...oldState.fruits,action.fruit]
      };
    case CLEAR_FRUIT:
      return _defaultState;
    //in case the action is not something we're interested in
    //will also return defaultState the first time around
    default:
      return oldState;

  }
};

export default reducer;
