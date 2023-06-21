import { useState } from 'react';
import './App.css';
import OneComponent from './components/OneComponent';
import ThreeComponent from './components/ThreeComponent';
import FiveComponent from './components/FiveComponent';
import TwoComponent from './components/TwoComponent';
import FourComponent from './components/FourComponent';
import SixComponent from './components/SixComponent';
function App() {
  const[idx,setIdx]=useState(1);
  //select 이벤트
  const changeComponent=(e)=>{
    //alert(e.target.value,typeof(e.target.value));
    //setter 함수가 호출 될 때 마다 자동 랜더링
  setIdx(Number(e.target.value));
  
  
  }
    return (
      <div className="App">
        <img alt='' src='./10.png' className='App-logo'/>
      <h2>2023-05-31 react 수업</h2>
      <select className='form-select a' 
      style={{width:'200px', marginLeft:'150px'}}
      onChange={changeComponent} >
       <option value={1}>원 깐뽀넌뚜</option>
       <option value={2}>투 깐뽀넌뚜</option>
       <option value={3}>쓰리 깐뽀넌뚜</option>
       <option value={4}>포 깐뽀넌뚜</option>
       <option value={5}>파이브 깐뽀넌뚜</option>
       <option value={6}>씩스 깐뽀넌뚜</option>
       </select>
   
   <br/><br/>
   {idx===1?<OneComponent/>:idx===2?<TwoComponent/>:
   idx===3?<ThreeComponent/>:idx===4?<FourComponent/>:idx===5?
   <FiveComponent/>:<SixComponent/>
   }
  </div>
 );
}

export default App;