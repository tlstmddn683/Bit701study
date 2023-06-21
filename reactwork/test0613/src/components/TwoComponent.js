import React, { useState } from 'react';

function OneComponent(props) {
    const[message,setMessage]=useState('마우스위치');
    const handleEvent=(e)=>{
            setMessage(`마우스 위치=>x좌표:${e.pageX-40},Y좌표${e.pageY-234}`);
    }
    return (
        <div>
            <h2 className='alert alert-success'>Two Component</h2>
            <div onMouseMove={handleEvent} style={{width:'500px',height:'300px',border:'1px solid gray',margin:'40px 40px'}}>
                <h5>마우스 이동시 좌표출력</h5>
                <br></br>
                <h5>{message}</h5>
            </div>
            
        </div>
    );
}

export default OneComponent;