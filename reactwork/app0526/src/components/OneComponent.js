import React, { useState } from 'react';
import img1 from '../image/1.jpg';


function OneComponent(props) {
    const[foodName1,setFoodName1]=useState("샌드위치");
    const[foodName2,setFoodName2]=useState("망고빙수");
    //출력은 가능하지만 수정을 할 수 없다
    let message="버거킹 미쳤다";

    return (
        <div>
            <h5 style={{border:'3px solid gray',backgroundColor:'#add8e6'}}>
                One Component 실습
            </h5>
            <h4 className='one two'>{message}</h4>
            <h5>import 를 이용해서 src 이미지 가져오기</h5>
            <img alt='' src={img1} width={200}/>
            <b>{foodName1}</b>
            <br/>
            <h5>require 를 이용해서 src 이미지 가져오기</h5>
            <img alt='' src={require(`../image/11.jpg`)} width={200}/>
            <b>{foodName2}</b>
            <hr/>
            <div className='input-group'>
            <input type='text' className='form-control'
            placeholder='첫번째음식이름' onKeyUp={(e)=>{
                setFoodName1(e.target.value);
            }}
            />
            <input type='text' className='form-control'
            placeholder='두번째음식이름 - 엔터'
            onKeyUp={(e)=>{
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