
//constants to battle typos from failing silently
export const ADD_FRUIT = "ADD_FRUIT";
export const CLEAR_FRUIT = "CLEAR";
export const ADD_APPLE = "ADD_APPLE";
export const ADD_ORANGE = "ADD_ORANGE";


//paren for ES6 implicit return
//but returning an object
export const addFruit = fruit => ({
  type: ADD_FRUIT,
  fruit
});

export const addApple = () => ({
  type: ADD_APPLE,
  fruit: "Apple"
});

export const addOrange = () => ({
  type: ADD_ORANGE,
  fruit: "Orange"
});

export const clearFruit = () => ({
  type: CLEAR_FRUIT

});
