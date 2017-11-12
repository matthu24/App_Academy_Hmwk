const selectCurrency = (baseCurrency, rates) => {
  return{
    type: "SWITCH_CURRENCY",
    //these are for changing the state
    baseCurrency: baseCurrency,
    rates:rates
  };
};

export default selectCurrency
