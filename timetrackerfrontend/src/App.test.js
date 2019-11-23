import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import { shallow, configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';

describe('App', () => {
  configure({ adapter: new Adapter() });

  it('app should renders without crashing', () => {
    const div = document.createElement('div');
    ReactDOM.render(<App />, div);
    ReactDOM.unmountComponentAtNode(div);
  });
  
  it('should render hello world', () => {
    const wrapper = shallow(<App />);
    const text = wrapper.find('div').text();
    expect(text).toEqual('Hello, World!');
  });

});