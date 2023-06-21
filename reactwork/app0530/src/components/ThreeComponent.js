import React, { useRef, useState } from 'react';

function ThreeComponent(props) {
    const [count,setCount]=useState(1);
    const countRef=useRef(1);
    console.log("랜더링중....");

    const stateIncreEvent=()=>{
        setCount(count+1);//값 변경 될 때 마다 랜더링 발생
    }
    
    const refIncreEvent=()=>{
        countRef.current=countRef.current+1;//값 변경은 되지만 랜더링이 되지않는다(랜더링 발생시표시됨)
        console.log("countRef변수값:"+countRef.current);
    }
    return (
        <div>
             <h2 className='alert alert-success'>ThreeComponent-useRef</h2>
            <h1>state:{count}</h1>
            <h1>ref:{countRef.current}</h1>
            <button type='button'onClick={stateIncreEvent} className='btn btn-danger myButton'>증가-state변수 증가</button>&nbsp;
            <button type='button'onClick={refIncreEvent} className='btn btn-info myButton'>증가-ref 로 변수 증가</button>
            
        </div>
    );
}

export default ThreeComponent;