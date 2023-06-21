import React from 'react';
import '../App.css';
import { Delete, DeleteForever } from '@mui/icons-material';
import Swal from 'sweetalert2';

function OneArraylist(props) {
    const {idx,row,onDelete}=props;
   
    return (
        <div className='rowstyle'>
            <b>{row.irum}</b>
            <span className='day'>{row.today.toLocaleDateString('ko-KR')}
            &nbsp;
           <Delete onClick={()=>{
            onDelete(idx)
           }} style={{cursor:'pointer'}}/>
           {/*sweetalert2 사용해보기*/}
           <DeleteForever onClick={()=>{
            Swal.fire({
                title:'삭제확인',
                text:'해당 방명록 글을 삭제 하시겠습니까?',
                icon:'Warning',
                confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
                cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
                showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
                confirmButtonText: '승인', // confirm 버튼 텍스트 지정
                cancelButtonText: '취소', // cancel 버튼 텍스트 지정
            }).then((result)=>{
                if(result.isConfirmed){
                //삭제함수 호출
                     onDelete(idx);
                     Swal.fire("삭제완료!");
                }else{
                    Swal.fire("취소!!");
                }
            })
           }} style={{cursor:'pointer'}}/>
            </span>
            <br/><br/>
            <h5><b>{row.message}</b></h5>
        </div>
    );
}

export default OneArraylist;