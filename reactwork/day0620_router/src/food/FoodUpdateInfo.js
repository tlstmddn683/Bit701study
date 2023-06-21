import React, { useEffect, useRef, useState } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import "./foodstyle.css";
import  Axios  from 'axios';
function FoodUpdateInfo(props) {
    const [foodData,setFoodData]=useState('');

    const {num}=useParams();
    const navi=useNavigate();
     //num에 해당하는 dto 얻어서 data에 넣기
   const getData=()=>{
    const detailUrl="/react/detail?num="+num;
    Axios.get(detailUrl)
    .then(res=>{
        setFoodData(res.data);
        //data중 fphoto는 ,로 분리해서 photo에 넣기
        
    })

}
useEffect(()=>{
    getData();
   },[]);

//submit 발생 이벤트
   const onSubmitEvent=(e)=>{
    //기본 이벤트를 무효화(action 호출 막기 위해서)
    e.preventDefault();
  
  const url="/react/update";
  Axios.post(url,foodData)
  .then(res=>{
    //상세페이지로 이동
    navi(`/food/detail/${num}`);
  });
}

    return (
        <div className='foodcontainer'> 
            <h5>수정하기</h5>
            <form onSubmit={onSubmitEvent}>
                <table className='table' style={{width:'400px'}}>
                    <tr>
                        <th style={{width:'150px',backgroundColor:'#ddd'}}>예약자이름</th>
                        <td>
                            <input type='text' className='form-control' required value={foodData.fname}
                            onChange={(e)=>setFoodData({
                                ...foodData,
                                "fname":e.target.value
                            })}/>
                        </td>
                    </tr>
                    <tr>
                        <th style={{width:'150px',backgroundColor:'#ddd'}}>핸드폰</th>
                        <td>
                            <input type='text' className='form-control' required value={foodData.fhp}
                             onChange={(e)=>setFoodData({
                                ...foodData,
                                "fhp":e.target.value
                            })}/>
                        </td>
                    </tr>
                    <tr>
                        <th style={{width:'150px',backgroundColor:'#ddd'}}>예약날짜</th>
                        <td>
                            <input type='date' className='form-control' required value={foodData.bookingday}
                            onChange={(e)=>setFoodData({
                                ...foodData,
                                "bookingday":e.target.value
                            })}/>
                        </td>
                    </tr>
                    <tr>
                        <th style={{width:'150px',backgroundColor:'#ddd'}}>하고싶은말</th>
                        <td>
                            <textarea onChange={(e)=>setFoodData({
                                ...foodData,
                                "fcontent":e.target.value
                            })} className='form-control'
                            style={{width:'100%',height:'100px'}} value={foodData.fcontent}>
                            </textarea>
                        </td>
                    </tr>
                    <tr style={{height:'80px'}}>
                        <td colSpan={2} align='center'>
                            <button type='submit' className='btn btn-outline-danger'>DB수정</button>
                            <button type='reset' className='btn btn-outline-danger'
                            style={{marginLeft:'10px'}}>초기화</button>                           
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    );
}

export default FoodUpdateInfo;