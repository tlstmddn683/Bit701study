import React, { useState } from 'react';

function ThreeSubApp(props) {

    const onSelectChange = (e) => {
        
        let photo=e.target.value; // 선택된 값으로 photo 상태 업데이트
        let photoName=e.target.options[e.target.selectedIndex].text; // 선택된 텍스트로 photoName 상태 업데이트
        props.onChangePhoto(photo,photoName);
    };

    return (
        <div style={{width:'200px',marginLeft:'100px'}}>
            <select className='form-select' onChange={onSelectChange}>
                <option value={'2.png'}>크리스마스 트리</option>
                <option value={'10.png'}>눈사람</option>
                <option value={'11.png'}>산타</option>
                <option value={'3.png'}>별장</option>
                <option value={'4.png'}>꽃을 든 소녀</option>
            </select>
        </div>
    );
}

export default ThreeSubApp;