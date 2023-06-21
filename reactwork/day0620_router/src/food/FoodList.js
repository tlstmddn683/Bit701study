import React, { useEffect, useState } from 'react';
import "./foodstyle.css";
import { useNavigate } from 'react-router-dom';
import Axios from 'axios';
import FoodRowItem from './FoodRowItem';

function FoodList(props) {
    const navi=useNavigate();
    const [foodlist,setFoodlist]=useState([]);
    //서버로 부터 목록을 가져오는 함수
    const list=()=>{
        const listUrl="/react/list";
        Axios.get(listUrl)
        .then(res=>{
            setFoodlist(res.data);
        })
    }
    //처음 시작시 목록 호출
    useEffect(()=>{
        list();
    },[])
    return (
        
        <div className='foodcontainer'>
            <button type='button' className='btn btn-outline-danger'
            onClick={()=>navi("/food/form")}>예약추가</button>
            <hr/>
            <h5>총 {foodlist.length}개의 예약이 있습니다</h5>     
            {
                foodlist.map((item,idx)=><FoodRowItem key={idx} item={item}/>)
            }
        </div>
    );
}

export default FoodList;