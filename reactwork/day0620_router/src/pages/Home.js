import React from 'react';
import { NavLink, Route, Routes } from 'react-router-dom';
import HomeSub from './HomeSub';
import HomeSub2 from './HomeSub2';
import HomeSub3 from './HomeSub3';

function Home(props) {
    return (
        <div>
            <h3 className='alert alert-info'>Home Page 입니다</h3>
            <br/><br/><br/><br/>
            &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
            <NavLink to="/home/sub1">sub1</NavLink>
            &nbsp; &nbsp;
            <NavLink to="/home/sub2">sub2</NavLink>
            &nbsp; &nbsp;
            <NavLink to="/home/sub3">sub3</NavLink>
            <br/><br/>
            {/*중첩 라우터 설정 -home 안에 sub1 sub2 sub3 설정 */}
            <Routes>
                    <Route path='sub1' element={<HomeSub/>}/>
                    <Route path='sub2' element={<HomeSub2/>}/>
                    <Route path='sub3' element={<HomeSub3/>}/>
            </Routes>
        </div>
    );
}

export default Home;