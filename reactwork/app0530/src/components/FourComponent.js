import React, { useRef, useState } from 'react';

function FourComponent(props) {
    const [content,setContent]=useState('');
    const [content2,setContent2]=useState('');
    const contentRef=useRef('');//ref변수 선언
    console.log("랜더링 중...");
    return (
        <div>
             <h2 className='alert alert-success p'>FourComponent-useRef</h2>
             <textarea style={{width:'300px',height:'100px'}}
             onChange={(e)=>{
                setContent(e.target.value);
             }}
             ></textarea>
             <h4 className='alert alert-danger p'>{content}</h4>
             <hr/>
             <textarea  style={{width:'300px',height:'100px'}} ref={contentRef}></textarea><br/>
             <button type='button' className='btn btn-danger myButton' onClick={()=>{
               setContent2(contentRef.current.value); 
               //입력을 하다가 버튼을 누르면 그떄 content2 에 값이 들어가면서 랜더링이 발생한다
             }}>ref Content적용</button>
             <h4 className='alert alert-danger p'>{content2}</h4>
        </div>
    );
}

export default FourComponent;