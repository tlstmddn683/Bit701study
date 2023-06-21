import React from 'react';
import Menu from './components/Menu';
import { Route, Routes } from 'react-router-dom';
import { About, Food, Home, Main } from './pages';//pages 폴더의 index.js 가 자동으로  import

function RouteMain(props) {
    return (
        <div>
            <Menu/>
            <hr style={{clear:'both'}}/>
            <Routes>
                <Route path='/' element={<Main/>}/>
                <Route path='/home/*' element={<Home/>}/>

                {/* <Route path='/about' element={<About/>}/>
                <Route path='/about/:emp' element={<About/>}/>
                {/*파라미터를 넘길떄 사용*/}
                {/*위 코드를 다른 방법으로 해보자 */}
                <Route path='/about' element={<About/>}>
                    <Route path={":emp"} element={<About/>}/>
                </Route>

                {/* <Route path='/food' element={<Food/>}/> */}
                <Route path='/food' element={<Food/>}>
                    <Route path=':food1' element={<Food/>}/>
                    <Route path=':food1/:food2' element={<Food/>}/>
                </Route>

                {/* url 직접 써가며 테스트 하기
                login/member ,login/home 등등 아무거나 전부 가능!
                */}
                <Route path='/login/*' element={
                    <div>
                    <h2>login의 하위 메뉴들 입니다</h2>
                    <Home/>  {/*원하는 컴포넌트 넣어도됨*/}
                    <Food/>
                </div>
                }/>

                {/*위의 매핑 주소 외에는 무조건 에러페이지 표시 */}
                <Route path='*' element={
                    <div>
                        <h1>Error 404</h1>
                        <h2>잘못된 페이지 입니다.</h2>
                    </div>
                }/>
            </Routes>
        </div>
    );
}

export default RouteMain;