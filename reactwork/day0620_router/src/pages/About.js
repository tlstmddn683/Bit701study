import React from 'react';
import { useParams } from 'react-router-dom';

function About(props) {
    const {emp}=useParams();//emp 파라미터 읽기

    return (
        <div>
            <h3 className='alert alert-info'>About Page 입니다</h3>
            {
                emp==null?
                <h3>저는 지금 직장을 구하고 있습니다</h3>:
                <h4>저는 {emp}에 다니고 있습니다 </h4>
            }
        </div>
    );
}

export default About;