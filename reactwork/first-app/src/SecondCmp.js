import React from "react";
import './MyStyle.css';
import img1 from './1.png';
const SecondCmp=()=>{
    return(
        <div>
            <h2 className="title">두번째 컴포넌트</h2>
            <h3 className="msg1">시공조아</h3>
            <img alt="질럿" src={img1} className="photo1"/>
        </div>
    )
}
export default SecondCmp;