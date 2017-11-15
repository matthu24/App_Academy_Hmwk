import * as APIUtil from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS';
export const REQUEST_SEARCH_GIPHYS = 'REQUEST_SEARCH_GIPHYS';

//actions: all changes to app should come from action
//1. fetch search giphy comes from

export const receiveSearchGiphys = giphys => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys
  };
};

//thunk action creator
export const fetchSearchGiphys = (searchTerm) => (dispatch) => {
  //calls fetchSearchGiphys function which makes ajax call
  //after ajax call is made we can dispatch
  //giphys after the then is the response from the ajax call
  //we can pass this data to receieveSearchGiphys
  APIUtil.fetchSearchGiphys(searchTerm)
                            .then(giphys => dispatch(receiveSearchGiphys(giphys.data)));
};
