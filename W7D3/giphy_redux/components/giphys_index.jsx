import React from 'react';

import GiphysIndexItem from './giphys_index_item';

function GiphysIndex({ giphyss }) {
  return (
    <ul>
      { giphyss.map(giphy => <GiphysIndexItem key={giphy.id} giphy={giphy} />) }
    </ul>
  );
}

export default GiphysIndex;
