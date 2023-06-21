import React, { useEffect, useState } from 'react';
import "./foodstyle.css";
import { useNavigate, useParams } from 'react-router-dom';
import  Axios  from 'axios';

function FoodDetail(props) {
    const [data,setData]=useState('');
    const [photo,setPhoto]=useState([]);
    
    //원본사진 url
    const photourl=process.env.REACT_APP_FOODURL;

    const {num}=useParams();
    console.log({num});
    console.log({num}.num);

    const navi=useNavigate();

   //num에 해당하는 dto 얻어서 data에 넣기
   const getData=()=>{
        const detailUrl="/react/detail?num="+num;
        Axios.get(detailUrl)
        .then(res=>{
            setData(res.data);
            //data중 fphoto는 ,로 분리해서 photo에 넣기
            setPhoto(res.data.fphoto.split(","));
        })

   }
   useEffect(()=>{
    getData();
   },[]);
//삭제 이벤트
const deleteButtonEvent=()=>{
    const b=window.confirm("삭제하시겠습니까?");
    if(!b){
        return;
    }
    const url="/react/delete?num="+num;
    Axios.delete(url)
    .then(res=>{
        //삭제후 목록으로
        navi("/food/list");
    })
}
    return (
        <div className='foodcontainer'>'
            <div>
                <button type='button' className='btn btn-outline-success' style={{width:'80px' ,marginRight:'10px'}} onClick={()=>navi("/food/form")}>예약추가</button>
                <button type='button' className='btn btn-outline-success' style={{width:'80px' ,marginRight:'10px'}} onClick={()=>navi("/food/list")}>예약목록</button>
                <button type='button' className='btn btn-outline-success' style={{width:'80px' ,marginRight:'10px'}} onClick={()=>navi(`/food/updatephoto/${num}`)}>사진수정</button>
                <button type='button' className='btn btn-outline-success' style={{width:'80px' ,marginRight:'10px'}} onClick={()=>navi(`/food/update/${num}`)}>내용수정</button>
                <button type='button' className='btn btn-outline-success' style={{width:'80px' ,marginRight:'10px'}} onClick={deleteButtonEvent}>삭제</button>
            </div><br/>
            <h4>예약자명: {data.fname}</h4>
            <h5>사진들</h5>
            {
                photo.map((myphoto,idx)=><img alt='' className='myphoto' src={`${photourl}${myphoto}`}/>)
            }
            <br/>
            <h5>핸드폰:{data.fhp}</h5>
            <h5>예약일:{data.bookingday}</h5>
            <h5>주문내용</h5>
            <pre style={{marginLeft:'10px',fontSize:'18px',color:'blue'}}>{data.fcontent}</pre>
        </div>
    );
}

export default FoodDetail;<h1>fooddetail</h1>