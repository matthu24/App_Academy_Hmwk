import { connect } from 'react-redux';
import GiphysSearch from './giphys_search';
import { fetchSearchGiphys } from '../actions/giphy_actions';

//connects redux to react component
//redux has stores
//react has states
//
const mapStateToProps = state => ({
  giphys: state.giphys
});

//USE THE THUNK action creator instead!  it includes the regular action creator

const mapDispatchToProps = dispatch => ({
  fetchSearchGiphys: (searchTerm) => dispatch(fetchSearchGiphys(searchTerm))
});

const GiphysSearchContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(GiphysSearch);

export default GiphysSearchContainer;
