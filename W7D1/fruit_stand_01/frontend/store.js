import { createStore } from 'redux';
import reducer from './reducer.js';
import { addFruit, clearFruit, addOrange, addApple } from './actions.js';

//passes in reducer, which by default passes in the default state {fruits:[]}
const Store = createStore(reducer); // instantiate app's store with app's reducer

// put store and actions on the window
window.store = Store;
window.addFruit =addFruit;
window.clearFruit = clearFruit;
window.addOrange =addOrange;
window.addApple = addApple;

export default Store;
