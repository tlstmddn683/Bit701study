import React, { useState } from 'react';
import '../App.css';
function SevenComponent(props) {
    const [array,setArray]=useState(["red","green","blue","orange","gray"]);
    return (
        <div>
            <h5 style={{border:'3px solid gray',backgroundColor:'#add8e6'}}>
                Seven Component 실습
            </h5>
            <div>
                <h5>색상 추가(색상 더블클릭시 삭제)</h5>
                <input type='text' placeholder='색상 입력 ㄱ'
                onKeyUp={(e)=>{
                    if(e.key==='Enter'){
                    //리액트는 배열의 추가를 concat을 이용해서 추가한다.
                    setArray(array.concat(e.target.value))
                    e.target.value='';
                    }
                }} />
                <br/>
                <input type='color'
                onBlur={(e)=>{
                    setArray(array.concat(e.target.value));
                }}
                />
            </div>
          <div>
          {
                array.map((color,idx)=>
                (
                <div style={{clear:'both',marginLeft:'200px',width:'200px'}}>
                <div key={idx} style={{backgroundColor:color}} className='circle'
                onDoubleClick={(e)=>{
                    //idx 번지를 제거
                    alert((idx+1)+"번째 색상 제거 완료!!");
                    setArray([
                        ...array.slice(0,idx),
                        ...array.slice(idx+1,array.length)

                    ])
                }}

                >{idx+1}</div>
                <span style={{fontSize:'20px'}}>{color}</span>
                </div>
                ))
            }
          </div>
        </div>
    );
}

export default SevenComponent;