import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import RootReducer from '../reducers/root_reducer';

//does not invoke immeidately
const configureStore = () =>{
  return createStore(RootReducer, applyMiddleware(thunk));
};


export default configureStore;
