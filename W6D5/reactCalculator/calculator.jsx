import React from 'react';

class Calculator extends React.Component{
  constructor(){
    super();
    //your code here
    this.state = {num1: "", num2: "", result: 0 };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  //Notes:
  //sumNum1 is called whenever OnChange event listener happens in the first input field.
  //the ternary operator is in case the user inputs a backspace and leaves nothing in the field
  //if this happens, an empty string is returned instead of trying to turn nothing into an integer
  //e.target is the input field
  //the value of e.target is set by this.state.num1

  //regarding the short hand for setState:
  //setState usually takes a key value hash
  //if the key and value have the same value, can just put one of them


  setNum1(e){
    const num1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num1 });
  }

  setNum2(e){
    const num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num2 });
  }

  add(e){
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({result});
    console.log(this.state);
  }

  subtract(e){
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({result});
  }


  multiply(e){
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({result});
  }

  divide(e){
    e.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({result});
  }

  clear(e){
  e.preventDefault();
  this.setState({ num1: "", num2: "", result: 0 });
}


//num1, num2, and result are variables set to the state values
//when input is changed, setNum is called
//setNum turns the string number inputted by user and parseInt to an integer, and sets num1 state as the integer
//the value of the input is then also set to that integer
  render(){
    const {num1,num2,result} = this.state;
    return (
      <div>
        <h1>{result}</h1>

            <input onChange = {this.setNum1} value={num1}/>
        <input onChange = {this.setNum2} value={num2}/>
          <button onClick={this.clear}>Clear</button>
       <br />

       <button onClick={this.add}>+</button>
       <button onClick={this.subtract}>-</button>
       <button onClick={this.multiply}>*</button>
       <button onClick={this.divide}>/</button>

      </div>
    );
  }
}

export default Calculator;
