import React from 'react';
import { useParams } from 'react-router-dom';
import { requirePropFactory } from '@mui/material';
function Food(props) {
    const {food1,food2}=useParams();
    console.log(food1,food2);
    return (
        <div>
            <h3 className='alert alert-info'>Food Page 입니다</h3>
           
            {
                food1==null&&food2==null?
                <h3>오늘의 점심메뉴는 없습니다</h3>:
                food1!=null&&food2==null?<div>
                <h3>오늘의 점심메뉴 입니다</h3>
                <img alt='' src={require(`../image/${food1}.jpg`)} width={100}/>
                </div>:
                <div>
                 <h3>오늘의 점심메뉴는 2가지 입니다</h3>
                 <img alt='' src={require(`../image/${food1}.jpg`)} width={100}/>&nbsp;
                 <img alt='' src={require(`../image/${food2}.jpg`)} width={100}/>
                 </div>
            }
        </div>
    );
}

export default Food;