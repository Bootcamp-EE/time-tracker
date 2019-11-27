import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import { shallow, configure } from 'enzyme';
import Adapter from 'enzyme-adapter-react-16';
import mockAxios from "axios";
import waitUntil from 'async-wait-until'


describe('<App />', () => {
  configure({ adapter: new Adapter() });
  const greetingText = 'Hello, World!'


  beforeEach(() => {
  });

  it('should renders without crashing', () => {
    const div = document.createElement('div');
    ReactDOM.render(<App />, div);
    ReactDOM.unmountComponentAtNode(div);
  });

  it('should render hello world', async () => {
    //given
    var impl=mockAxios.get.mockImplementation(() =>
      Promise.resolve({
        data: {"id":"hello","message":"Hello, World!"}
      })
    );
    //when
    const wrapper = shallow(<App />);

    //then
    //assert method 2
    setTimeout(() => {
      const text = wrapper.find('div').text();
      expect(text).toEqual(greetingText);
    }, 100);

     //assert method 1
     await waitUntil(() => wrapper.state('greeting') != null);
     const text = wrapper.find('div').text();
     expect(text).toEqual(greetingText);
  });
});
