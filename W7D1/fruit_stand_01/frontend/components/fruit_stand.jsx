import React from 'react';

//funcitonal component
const FruitStand = (props) => (
  <div>
  <ul>
    {props.fruits.map((fruit,idx) => <li key={idx}>{fruit}</li>)}
  </ul>
  <button onClick = {props.addApple}>Apple</button>
    <button onClick = {props.addOrange}>Orange</button>
    <button onClick = {props.clearFruit}>Clear</button>
  </div>
);

export default FruitStand;
