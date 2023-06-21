import React, { useRef, useState } from 'react';

function FiveComponent(props) {
    const nameRef=useRef('');
    const javaRef=useRef('');
    const mysqlRef=useRef('');
    const springRef=useRef('');
    const [msg, setMsg]=useState('');
    
    console.log("랜더링중...");

    const buttonEvent=()=>{
        let name=nameRef.current.value;
        let java=Number(javaRef.current.value);
        let mysql=Number(mysqlRef.current.value);
        let spring=Number(springRef.current.value);

        let total=java+mysql+spring;
        let avg=total/3;

        let s=
        
        `
        [점수 결과]
        이름:${name}
        java:${java}점
        mysql:${mysql}점
        spring:${spring}점
        총점:${total}점
        평균:${avg.toFixed(1)}점
        `
        nameRef.current.value='';
        setMsg(s);
    }

    return (
        <div>
             <h2 className='alert alert-success'>FiveComponent</h2>
             <div className='input-group'>             
             이름:<input type='text'className='form-control'ref={nameRef} value='홍길동' style={{height:'25px'}} />&nbsp;
             java:<input type='text'className='form-control'ref={javaRef} style={{height:'25px'}}/>&nbsp;
             mysql:<input type='text'className='form-control'ref={mysqlRef} style={{height:'25px'}}/>&nbsp;
             spring:<input type='text'className='form-control'ref={springRef} style={{height:'25px'}}/>
            </div>
            <br/>
            <button type='button' className='btn btn-danger myButton' onClick={buttonEvent} style={{marginLeft:'30px'}}>결과확인하기</button>
            <div style={{width:'300px' ,height:'600px' ,float:'right', fontFamily:'Nanum Pen Script',fontSize:'30px' ,whiteSpace:'pre-line',marginRight:'50px'}}>{msg}</div>
        </div>
    );
}

export default FiveComponent;