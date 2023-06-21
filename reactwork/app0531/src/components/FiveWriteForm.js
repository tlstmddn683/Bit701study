import React, { useState } from 'react';

function FiveWriteForm(props) {
    const [writer,setWriter]=useState('');
    const [subject,setSubject]=useState('');
    const [content,setContent]=useState('');
    const [photo,setPhoto]=useState('flogirl.gif');

    const buttonAddEvent=()=>{
        props.addBoard({writer,subject,content,photo});
    }
    return (
        <div>
          작성자 : <input type='text' onChange={(e)=>setWriter(e.target.value)}/><br/>
          제 목  : <input type='text' onChange={(e)=>setSubject(e.target.value)}/><br/>
          사 진  : 
            <select style={{width:'170px'}}  onChange={(e)=>setPhoto(e.target.value)}>
                <option value={'flogirl.gif'}>꽃을든소녀</option>
                <option value={'asman.gif'}>스노우맨</option>
                <option value={'a7.gif'}>곰돌이</option>
                <option value={'house5.gif'}>대저택</option>
                <option value={'candle1.gif'}>촛불</option>                
            </select><br/>
            <textarea style={{width:'400px',height:'130px'}}
             onChange={(e)=>setContent(e.target.value)}></textarea>
            <br/>
            <button type='button' onClick={buttonAddEvent}>게시글 등록</button>

           
        </div>
    );
}

export default FiveWriteForm;