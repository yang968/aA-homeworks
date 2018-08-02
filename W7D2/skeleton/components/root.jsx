import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

// import { fetchSearchGiphys } from '../util/api_util'
import { receiveSearchGiphys, fetchSearchGiphys } from '../actions/giphy_actions';
import configureStore from '../store/store';
// window.fetchSearchGiphys = fetchSearchGiphys;
const store = configureStore();

const Root = ({ store }) = {
  return (
    <Provider store={store}>
      <GiphysSearchContainer />
    </Provider>
  )
}

// document.addEventListener("DOMContentLoaded", () => {
//   window.store = store;
//   window.fetchSearchGiphys = fetchSearchGiphys;
//   window.receiveSearchGiphys = receiveSearchGiphys;
//   // const root = document.getElementById('root');
// 	// ReactDOM.render(<Root store={store} />, root);
// })

export default Root;
