import React from 'react';
import "../App.css";
import { NavLink } from 'react-router-dom';
function Menu(props) {
    return (
        <div>
            <ul className='menu'>
                 <li><NavLink to={"/"}>Main</NavLink></li>
                <li><NavLink to={"/home"}>Home</NavLink></li>
                <li><NavLink to={"/food"}>Food #1</NavLink></li>
                <li><NavLink to={"/food/3"}>Food #2</NavLink></li>
                <li><NavLink to={"/food/5/12"}>Food #3</NavLink></li>
                <li><NavLink to={"/about"}>About #1</NavLink></li>
                <li><NavLink to={"/about/Samsung"}>About #2</NavLink></li> 
                <li><NavLink to={"/about/비트캠프"}>About #3</NavLink></li> 

            </ul>
        </div>
    );
}

export default Menu;