import ReactOnRails from 'react-on-rails';

import HelloWorld from '../components/HelloWorld';
import StatsForm from '../components/StatsForm';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  HelloWorld,
  StatsForm
});
