import { connect } from 'react-redux';
import { addFruit, clearFruit,addOrange, addApple } from '../actions';
//presentational component
import FruitStand from './fruit_stand';
//provider has a store prop and is responsible for making the redux store availalbe

//container component responsible for generating the props

//accepts application state as an argument
//returns an object that represents the props
//that get passed to the presentational component, FruitStand.jsx
//fruitstand component receives a prop called fruits
//fruits prop would be the array of fruits to render
//can get array of fruits from applcation state by looking at property state.fruits
const mapStateToProps = state => ({
  fruits: state.fruits
});

const mapDispatchToProps = dispatch =>({
  addApple: () => dispatch(addApple()),
  addOrange: () => dispatch(addOrange()),
  clearFruit: () => dispatch(clearFruit())
});

//this fcn is invoked inside of connect
//where does connect get the application state from ?
//

//want to connect presentational component (fruitstand) to redux store
//using mapStateToProps
export default connect(
  mapStateToProps,
  mapDispatchToProps
)(FruitStand);
//inside presentational component i'll have props called fruits
//which come from the state

//exporting connected component
