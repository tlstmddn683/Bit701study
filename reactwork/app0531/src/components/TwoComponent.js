import React from 'react';
import { Button } from '@mui/material';
import Swal from 'sweetalert2';
import xmas1 from '../xmas/2.png';
import xmas2 from '../xmas/tree1.gif';
import xmas3 from '../xmas/house2.gif';
function TwoComponent(props) {
    const buttonEvent1=()=>{
        // Swal.fire("안녕하세요?");
        Swal.fire( "아침인사","안녕하세요?");
                
    }
    const buttonEvent2=()=>{
        Swal.fire({
            title:'사진넣기',
            html:'<h5>메리 크리스마스!!!</h5>',
            imageUrl:xmas1 /* src의 사진 -import된 사진*/
            // imageWidth:200,
            // imageHeight:150
        })
    }
    const buttonEvent3=()=>{
        Swal.fire({
            html:`<b style="color:red">오늘 점심은 뭘까욧?</b>
            <h5>메리크리스마스</h5>
            <img src="../10.png" class="App-logo"></img>`,
            imageUrl:'../10.png',/*public 사진 */
            icon:'success',
            confirmButtonText:'YES',
            confirmButtonColor:'#abbbba',
            showCancelButton:true,
            cancelButtonColor:'#abbbca',
            cancelButtonText:'No'

        }).then((r)=>{
            if(r.isConfirmed){
                Swal.fire("확인 처리완료");

            }else{
                Swal.fire("취소 처리완료!");
            }
        })
    }
    const buttonEvent4=()=>{
        Swal.fire({
            title:'Input Email Address',
            input:'email',
            inputLabel:'Your Email Address',
            inputPlaceholder:'Enter Your Email Adress'
        }).then((result)=>{
            Swal.fire(`당신의 이메일 주소는 ${result.value}입니다`);
        })
    }
    const buttonEvent5=()=>{
        let arr=[{photo:xmas1,likesid:"701"},{photo:xmas2,likesid:"bit"},{photo:xmas3,likesid:"camp"}];
        let s='';
        for(let m of arr){
            s+=`<img alt='' src=${m.photo} width=60 class='App-logo'/>&nbsp;<b>${m.likesid}</b><br/>`;

        }
        Swal.fire({
            title:"좋아요를 누른 회원들",
            imageUrl:xmas1,
            html:s
        })
    }
    return (
        <div>
            <h2 className='alert alert-success'>Two Component</h2>
            <Button variant="contained" color='warning' onClick={buttonEvent1}>SweetAlert연습#1</Button>
            <br/><br/>
            <Button variant="outlined" color='error' onClick={buttonEvent2}>SweetAlert연습#2</Button>
            <br/><br/>
            <Button variant="contained" color='success' onClick={buttonEvent3}>SweetAlert연습#3</Button>
            <br/><br/>
            <Button variant="outlined" color='primary' onClick={buttonEvent4}>SweetAlert연습#4</Button>
            <br/><br/>
            <Button variant="contained" color='info' onClick={buttonEvent5}>SweetAlert연습#5</Button>
            <br/><br/>
        </div>
    );
}

export default TwoComponent;