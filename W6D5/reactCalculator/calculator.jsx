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

  //your code here

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




  render(){
    const {num1,num2,result} = this.state;
    return (
      <div>
        <h1>{result}</h1>
        //whenever input field is changed, on change event is executed: which is
        //setNum1, setNum1 changes the state, and the value is updated to num1 which is taken from this.state
        //(
            <input onChange = {this.setNum1} value={num1}/>
        <input onChange = {this.setNum2} value={num2}/>
          <button onClick={this.clear}>Clear</button>
       <br />
       //whenever button is clicked, onClick event is executed, which changes the state of
       //result, result is then outputted in h1 above
       <button onClick={this.add}>+</button>
       <button onClick={this.subtract}>-</button>
       <button onClick={this.multiply}>*</button>

      </div>
    );
  }
}

export default Calculator;
