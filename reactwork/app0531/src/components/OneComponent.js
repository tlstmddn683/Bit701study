import React, { useState } from 'react';
import OneWriteForm from './OneWriteForm';
import OneArraylist from './OneArraylist';

function OneComponent(props) {
    const [list,setList]=useState([
        {irum:"영민",message:"안녕?",today:new Date()},
        {irum:"성민",message:"Hi?",today:new Date()}
    ]);
    //추가이벤트
    const addListHandler=(data)=>{
        setList(list.concat(
            {
            ...data,
            today:new Date()
            }
        ));
    }
    const deleteMsg=(idx)=>{
        setList(list.filter((item,i)=>i!==idx));
    }
    return (
        <div>
             <h2 className='alert alert-success'>One Component 간단한 방명록</h2>
             <OneWriteForm onSave={addListHandler}/>
            <hr/>
            {
                list.map((ele,idx)=><OneArraylist onDelete={deleteMsg} key={idx} idx={idx} row={ele}/>)
                
            }
        </div>
    );
}

export default OneComponent;