import { AddAPhoto, AddAlarm, DeleteForever, DeleteSharp } from '@mui/icons-material';
import './MyStyle.css';
import React, { useState } from 'react';
import InputEmojiWithRef from 'react-input-emoji';
import { Button } from '@mui/material';

function FourthCmp(props) {
    //react에서 값을 변경하려면 반드시 useState를 이용해야만 한다
    const [number,setNumber]=useState(1);//number 변수에 초기값을 지정
    return (
        <div>
            <h2 className='title'>네번째 깜뽀넌뚜</h2>
            <DeleteForever/>
            <DeleteSharp/>
            <AddAlarm/>
            <AddAPhoto/>
            <InputEmojiWithRef
                style={{width:'200px'}}
                placeholder="입력ㄱ?"
            />
            <hr/>
            <a className='stylenum'>{number}</a>
            <br/><br/>
            <Button variant="contained" className='button1' color='success' onClick={()=>{     
                    if(number===0){
                        alert("0보다 작게는 불가능!!"); 
                    }else{
                        setNumber(number-1);  
                    }
            }}>감소</Button>&nbsp;&nbsp;
            <Button variant="contained" className='button2' color='warning' onClick={()=>{
                    if(number<10){
                        setNumber(number+1);

                    }else{
                        alert("더이상 증가할 수 없읍니다");
                        
                    }
            }}>증가</Button>
        </div>
    );
}

export default FourthCmp;