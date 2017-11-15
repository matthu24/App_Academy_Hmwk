import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props){
    super(props);
    this.state = {searchTerm: 'shiba'};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  // componentDidMount() {
  //   this.props.fetchSearchGiphys('shiba');
  // }

  handleSubmit(e){
    e.preventDefault();
    //gets searchTerm from state, splits on the space into an array, then joins into a string
    //using + to join
    //searchTerm is a string like "partone+parttwo"
    let searchTerm = this.state.searchTerm;
    this.props.fetchSearchGiphys(searchTerm);
  }

  handleChange(e){
    e.preventDefault();
    this.setState({searchTerm: e.target.value});
    console.log(e.target.value);
  }

  render(){
    // let { giphys } = this.props;
    return (
      <div>
        <form>
          <label>Search <input value={this.state.searchTerm} type = "text" onChange={this.handleChange}/></label>

          <button type='submit' onClick={this.handleSubmit}>Submit</button>

        </form>
        <GiphysIndex giphyss={this.props.giphys}/>

      </div>
    );
  }
}




export default GiphysSearch;
