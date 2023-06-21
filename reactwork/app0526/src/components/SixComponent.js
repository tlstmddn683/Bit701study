import React, { useState } from 'react';
import '../App.css';

function SixComponent(props) {
    const array1=["red","green","blue","orange","gray","pink","white","yellow","skyblue","crimson"];
    const array2=[
        {"foodphoto":"1.jpg","foodname":"샌드위치","foodprice":"3000"},
        {"foodphoto":"2.jpg","foodname":"꼬치","foodprice":"4000"},
        {"foodphoto":"3.jpg","foodname":"육칼","foodprice":"8000"},
        {"foodphoto":"4.jpg","foodname":"스튜","foodprice":"12000"},
        {"foodphoto":"5.jpg","foodname":"콘치즈","foodprice":"6000"},
        {"foodphoto":"6.jpg","foodname":"볶음밥","foodprice":"8000"},
        {"foodphoto":"1.png","foodname":"파이썬","foodprice":"666"},
        {"foodphoto":"2.png","foodname":"리눅스","foodprice":"666"}
    ];
    return (
        <div>
            <h5 style={{border:'3px solid gray',backgroundColor:'#add8e6'}}>
                Six Component 실습
            </h5>
          <div>
            <h6>array1 배열 출력</h6>
            {
                array1.map((color,idx)=>
                (<div key={idx} style={{backgroundColor:color}} className='circle'>{idx+1}</div>))
            }
            </div>
            <br style={{clear:'both'}}/>
            <div style={{marginTop:'20px'}}>
             <h6>array2 배열 출력</h6>
             
            {
                array2.map((food,idx)=>
                (<figure className='photo'>
                    <img alt='' src={require(`../image/${food.foodphoto}`)}/>
                    <figcaption>
                    <h5><b>{food.foodname}</b></h5>
                    <h5><b>{food.foodprice}원</b></h5>
                    </figcaption>
                  </figure>  
                  ))
              
            }
          </div>
        </div>
    );
}

export default SixComponent;