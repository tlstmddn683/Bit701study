import React, { useEffect, useState } from 'react';

function TwoComponent(props) {
    const [nameArray,setNameArray]=useState(["캔디","안토니"]);
    const [name,setName]=useState('');

    useEffect(()=>{
        setName('');
    },[nameArray]);
    //이름을 배열에 추가하는 함수(버튼이벤트)
    const addName=()=>{
            //set 메서드를 연속해서 호출 할 경우 순차적으로 실행이 안될 수 있다
            //그런 경우 반드시  nameArray가 변경된후 name이 변경되도록 하려면
            //name은 useEffect를 이용해서 변경하면된다
        setNameArray(nameArray.concat(name));
    }
    //idx번지의 이름을 삭제 (삭제 버튼 이벤트)
    const deleteName=(idx)=>{
        setNameArray(nameArray.filter((item,i)=>i!==idx));
    }
    return (
        <div>
             <h2 className='alert alert-success'>TwoComponent-배열 추가,삭제</h2>
        <div className='input-group' style={{width:'250px'}}>
        <h4 className='alert alert-info'>이름 입력</h4>
        <input type='text' className='form-control' value={name} 
        onChange={(e)=>{
        setName(e.target.value);
        }}/>
        <button type='button' className='btn btn-sm btn-outline-danger'
        onClick={addName}
        >추가</button>
        </div>
        <br/><br/>
        <hr/>
        {
            nameArray.map((item,idx)=>(
                <div className='input-group' style={{width:'300px',marginBottom:'10px'}}key={idx}>
                    <h4 style={{width:'200px'}}>{item}</h4>
                    <button type='button' className='btn btn-sm btn-danger' style={{marginLeft:'10px'}} 
                    onClick={()=>{
                    deleteName(idx)    
                    }}>삭제</button>

                </div>
            ))
        }
        </div>
    );
}

export default TwoComponent;