import { useState } from 'react';
import './App.css';
import OneComponent from './components/OneComponent';
import ThreeComponent from './components/ThreeComponent';
import FiveComponent from './components/FiveComponent';
import TwoComponent from './components/TwoComponent';
import FourComponent from './components/FourComponent';

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
     <h2>2023-05-26 react 수업</h2>
     <select className='form-select' 
     style={{width:'200px', marginLeft:'100px'}}
     onChange={changeComponent} >
      <option value={1}>원 깐뽀넌뚜</option>
      <option value={2}>뚜 깐뽀넌뚜</option>
      <option value={3}>뚜리 깐뽀넌뚜</option>
      <option value={4}>포올 깐뽀넌뚜</option>
      <option value={5}>뽜이브 깐뽀넌뚜</option>

     </select>
    
     <br/><br/>
     {idx===1?<OneComponent/>:idx===2?<TwoComponent/>:
     idx===3?<ThreeComponent/>:idx===4?<FourComponent/>:
     <FiveComponent/>
     }
    </div>
  );
}

export default App;
