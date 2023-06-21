import React from 'react';
import "../App.css";
import { useNavigate } from 'react-router-dom';
import Home from './Home';
function Main(props) {
    //리액트에서 페이지 이동시  Navigate 이용해서 이동함
    const navi=useNavigate();
    return (
        <div>
            <button type='button' className='mybtn'
            onClick={()=>navi("/home")}>Home 이동</button>
            <button type='button' className='mybtn'
            onClick={()=>navi("/food")}>Food 이동</button>
            <button type='button' className='mybtn'
            onClick={()=>navi("/about")}>About 이동</button>
            <button type='button' className='mybtn'
            onClick={()=>navi("/food/8/11")}>Food2 이동</button>
            <button type='button' className='mybtn'
            onClick={()=>navi("/about/네이버")}>About2 이동</button>
        </div>
    );
}

export default Main;