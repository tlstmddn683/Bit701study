import React, { useEffect, useState } from 'react';

function OneComponent(props) {
    const [number,setNumber]=useState(0);
    const [photo,setPhoto]=useState('1.png');
    const [visible,setVisible]=useState('hidden');

    // useEffect(()=>{
    //     console.log("useEffect 1")
    // });//모든 state변수 변경시 무조건 자동호출
    useEffect(()=>{
        console.log(" 처음 딱 한번만 호출")
    },[]);//처음 실행시 한번만 호출
    useEffect(()=>{
        console.log("useEffect 2-number 변경")
        setVisible(number%3===0?'visible':'hidden');
    },[number]);//number값 변경시 자동호출
    useEffect(()=>{
        console.log("useEffect 3-photo 변경")
    },[photo]);//photo값 변경시 자동호출
    
    const changePhoto=(e)=>{
        setPhoto(e.target.value)
    }
    return (
        <div>
            <h2 className='alert alert-success'>OneComponent</h2>
            <h1>{number}</h1>
            <button type='button' className='btn btn-info myButton'
            onClick={()=>{
                setNumber(number-1)
            }}>감소</button>&nbsp;&nbsp;
            <button type='button' className='btn btn-info myButton'
            onClick={()=>{
                setNumber(number+1)
            }}>증가</button>
            <hr/>
            <label>
                <input type='radio' name='photo' defaultChecked defaultValue={'1.png'}
                onClick={changePhoto}/>사진1번
            </label>
            &nbsp;
            <label>
                <input type='radio' name='photo'  defaultValue={'2.png'} onClick={changePhoto}/>사진2번
            </label>
            &nbsp;
            <label>
                <input type='radio' name='photo'  defaultValue={'10.png'} onClick={changePhoto}/>사진3번
            </label>
            &nbsp;
            <br/><br/>
            <img alt='' src={require(`../image/${photo}`)} className='App-logo'
            style={{visibility:visible}}/>
            <hr/>
        </div>
    );
}

export default OneComponent;