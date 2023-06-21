import Axios from 'axios';
import React, { useState } from 'react';

function FiveWriteForm({onSave}) {
    const [nickName,setNickName]=useState('');
    const [korMsg,setKorMsg]=useState('');
    const [engMsg,setEngMsg]=useState('');

    //메세지 입력시 이벤트
    const handleChangeMessage=(e)=>{
        if(e.key==='Enter'){
            if(e.target.value===''){
                setEngMsg('');
                return;
            }    
       
            const url="/memo/trans?korMsg="+e.target.value;
            Axios.get(url)
            .then(res=>{
                setEngMsg(res.data.message.result.translatedText);
            })
        }       
    }

    //저장버튼 이벤트
    const onSaveButtonEvent=()=>{
        if(nickName===''){
            alert("닉네임을 입력해주세요");
            return;
        }

        if(korMsg===''){
            alert("메세지를 입력해주세요");
            return;
        }

        if(engMsg===''){
            alert("메세지를 입력후 엔터를 눌러주세요");
            return;
        }
    
        onSave({nickname:nickName,kormsg:korMsg,engmsg:engMsg});    
        
        setNickName('');
        setKorMsg('');
        setEngMsg('');
        alert("저장되었습니다");
    }

    return (
        <div>
            <h4>Memo 데이터 추가</h4>
            <div className='input-group' style={{width:'200px'}}>
                <b>닉네임</b>&nbsp;&nbsp;&nbsp;
                <input type='text' className='form-control' value={nickName}
                onChange={(e)=>{
                    setNickName(e.target.value)
                }}
                />
                <button type='button' style={{marginLeft:'10px'}} className='btn btn-sm btn-outline-info'
                onClick={onSaveButtonEvent}
               >저장</button>
               </div>
               <b style={{color:'red'}}>메세지 입력후 엔터를 눌러주세요</b>
               <div className='input-group' style={{width:'500px'}}>
                <b>메세지</b>&nbsp;&nbsp;&nbsp;
                <input type='text'  className='form-control' value={korMsg}
                onChange={(e)=>setKorMsg(e.target.value)}
                onKeyUp={handleChangeMessage}
                />
                </div>
                <div className='input-group' style={{width:'500px'}}>
                <b>영어번역</b>&nbsp;
                <input type='text'  className='form-control' value={engMsg}
                readOnly
                />
            </div>
            <h3 className='alert alert-warning'>
                입력 확인:{nickName}/{korMsg}/{engMsg}
            </h3>
        </div>
    );
}

export default FiveWriteForm;