import React, { useState } from 'react';

function EightWriteApp({onSave}) {
    const [name,setName]=useState('candy');
    const [blood,setBlood]=useState('A');
    const [addr,setAddr]=useState('제주');
//추가 버튼 이벤트
    const addButton=()=>{
        // onSave({name:name,blood:blood,addr:addr});
        //key 와 value 값이 같을 경우 한번만 쓰면된다
        onSave({name,blood,addr});
    }
    return (
        <div>
            <input type='text' value={name} onChange={(e)=>setName(e.target.value)}/><br/>
            <input type='text' value={blood} onChange={(e)=>setBlood(e.target.value)}/><br/>
            <input type='text' value={addr} onChange={(e)=>setAddr(e.target.value)}/><br/>
            <button type='button' className='btn btn-danger myButton' onClick={addButton}>추가</button>
        </div>
    );
}

export default EightWriteApp;