import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

//root gives every component access to store through provider
const Root = ({ store }) => {
  return (
    <Provider store ={store}>
      <GiphysSearchContainer />
    </Provider>
  );
};

export default Root;
