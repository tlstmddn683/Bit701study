import React from 'react';
import "../App.css";
import DeleteIcon from '@mui/icons-material/Delete';
function FiveRowList({memo,onDelete}) {
    return (
        <div className='memolist'>
            닉네임:{memo.nickname}
            <span style={{float:'right',color:'gray',fontSize:'0.8em'}}>작성일:{memo.writeday}</span>
            <br/>
            <b style={{color:'black'}}>메세지: {memo.kormsg}</b>
            <br/>
            <b style={{color:'blue'}}>번역: {memo.engmsg}</b>
            <DeleteIcon style={{float:'right' ,cursor:'pointer'}} onClick={()=>{
                let b=window.confirm("삭제 하려면 [확인] 을 눌러주세요");
                if(!b)
                return;
                onDelete(memo.num);
            }}/>
        </div>
    );
}

export default FiveRowList;