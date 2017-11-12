const initialState = {
  baseCurrency: "Select a currency",
  rates: {}
};


//reducer receives current state, and action
const reducer = (state = initialState, action) => {
  switch(action.type){
    //if action type is switch currency, return a new state based on the extra payload from the action
    case "SWITCH_CURRENCY":
    //immuateable state, returns a new state
      return {
        baseCurrency:action.baseCurrency,
        rates:action.rates
      };
    default:
      return state;
  }
};


export default reducer;
