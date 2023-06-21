import { Button, TextField } from '@mui/material';
import React, { useState } from 'react';
import InputEmojiWithRef from 'react-input-emoji';

function OneWriteForm(props) {
    const [irum,setIrum]=useState('');
    const [message,setMessage]=useState('');

    const handleOnEnter=(text)=>{
        setMessage(text);
        console.log(text);
    }
    return (
        <div>
            <TextField
            required
            id="outlined-required"
            label="Nickname"
            value={irum}
            onChange={(e)=>setIrum(e.target.value)}
            />
            &nbsp;&nbsp;
            <Button variant="contained" size="large"
            onClick={()=>{
                if(irum===''){
                    alert("닉네임을 입력해주세요");
                    return;

                }
                if(message===''){
                    alert("메세지를 입력해주세요");
                    return;

                }
                //부모 컴포넌트로 입력데이터를 보낸다
                props.onSave({irum,message});
                setIrum('');
                setMessage('');
            }}
            >등록</Button>
            <br/><br/>

            <InputEmojiWithRef
            cleanOnEnter
            onEnter={handleOnEnter}
            placeholder="Type a message"
            />
        </div>
    );
}

export default OneWriteForm;