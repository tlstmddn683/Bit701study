import React, { useState } from 'react';
import img1 from '../image/1.jpg';
function OneComponent(props) {
    const[foodName1,setFoodName1]=useState("샌드위치");
    const[foodName2,setFoodName2]=useState("망고빙수");

    let message="맛있는 음식";
    return (
        <div>
            <h2 className='alert alert-success'>One Component</h2>
            <h5>import로 src 불러오기</h5>
            <img src={img1} alt='' width={200}/><br></br>
            <b>{foodName1}</b>
            <h5>require로 src </h5>
            <img alt='' src={require(`../image/11.jpg`)} width={200}/><br></br>
            <b>{foodName2}</b>
            <hr/>
            <div className='input-group'>
            <input type='text' className='form-control' placeholder='1번 음식이름' onKeyUp={(e)=>{
                setFoodName1(e.target.value);
            }}
            />
             <input type='text' className='form-control' placeholder='2번 음식이름' onKeyUp={(e)=>{
              if(e.key==='Enter'){
              setFoodName2(e.target.value);
              }
            }}
            />
            </div>
        </div>
    );
}

export default OneComponent;