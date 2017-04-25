import React from 'react';

export default class Home extends React.Component {
  render() {
    return(
      <div>
        <h1>FestiSwap</h1>
        <a href={'/events'}>Find Events</a>
        <a href={'/events/new'}>Create Event</a>

      </div>
    )
  }
}
