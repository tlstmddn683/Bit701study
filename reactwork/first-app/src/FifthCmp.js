import React, { useState } from 'react';
import './MyStyle.css';
function FifthCmp(props) {
    const[name,setName]=useState("짱구");
    const[addr,setAddr]=useState("떡잎마을");
    return (
        <div>
            <h2 className='title'>5번째 깐뿌난뚜</h2>
            <div style={{fontSize:'2em',fontFamily: 'Gowun Batang'}}> 
            이름:{name}<br/>
            주소:{addr}
            </div>
            <input type='text' value={setName} placeholder='이름입력ㄱ'
            onChange={(e)=>{
                setName(e.target.value);
            }}
            />
            <br/>
            <input type='text' value={setAddr} placeholder='주소입력ㄱ'
            onChange={(e)=>{
                setAddr(e.target.value);
            }}
            />

        </div>
        
    );
}

export default FifthCmp;