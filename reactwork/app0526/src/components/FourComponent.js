import React, { useState } from 'react';
import food from '../image/7.jpg';
import food2 from '../image/1.jpg';
import food3 from '../image/2.jpg';
import food4 from '../image/3.jpg';
import food5 from '../image/4.jpg';
function FourComponent(props) {
    const [bgcolor, setBgcolor] = useState('pink');
    const [fsize, setFontsize] = useState('10px');
    const [photo,setPhoto] = useState(food);
    const [show, setShow] = useState(false);

    const radioChangeBgcolor = (e) => {
        setBgcolor(e.target.value);
    }
    const changeFontSize = (e) => {
        setFontsize(e.target.value);
    }
    const changePhoto = (e) => {
        setPhoto(e.target.value);
    }
   

    return (
        <div>
            <h5 style={{ border: '3px solid gray', backgroundColor: '#add8e6' }}>
                Four Component 실습
            </h5>
            <h6>글꼴 크기 선택 프리즈</h6>
            <select
                className='form-select'
                style={{ width: '200px', marginLeft: '100px' }}
                onChange={changeFontSize} >
                <option selected>10px</option>
                <option>15px</option>
                <option>20px</option>
                <option>25px</option>
                <option>30px</option>
            </select>
            <h6>배경색 선택 프리즈</h6>
            <div>
                <label>
                    <input
                        type='radio'
                        name='bgcolor'
                        value='red'
                        onClick={radioChangeBgcolor}
                    />빨강
                </label>
                &nbsp;&nbsp;
                <label>
                    <input
                        type='radio'
                        name='bgcolor'
                        value='green'
                        onClick={radioChangeBgcolor}
                        
                    />초록
                </label>
                &nbsp;&nbsp;
                <label>
                    <input
                        type='radio'
                        name='bgcolor'
                        value='pink'
                        onClick={radioChangeBgcolor}
                        defaultChecked
                    />핑크
                </label>
                &nbsp;&nbsp;
                <label>
                    <input
                        type='radio'
                        name='bgcolor'
                        value='black'
                        onClick={radioChangeBgcolor}
                    />블랙
                </label>
                &nbsp;&nbsp;
                <label>
                    <input
                        type='radio'
                        name='bgcolor'
                        value='blue'
                        onClick={radioChangeBgcolor}
                    />파랑
                </label>
            </div>
            <div style={{ border: '3px solid gray', backgroundColor: bgcolor, fontSize: fsize}}>
                오늘은 즐거운 금요일~
            </div>
            <br/>
            <h6>사진 선택 프리즈</h6>
            <select
                className='form-select'
                style={{ width: '200px', marginLeft: '100px' }}
                onChange={changePhoto}>
                <option selected value={food}>괴식</option>
                <option value={food2}>샌드위치</option>
                <option value={food3}>꼬치구이</option>
                <option value={food4}>육칼</option>
                <option value={food5}>스튜</option>
            </select>

            <h5>사진 on off</h5>
            <label>
                <input
                    type='checkbox'
                    onClick={(e) => {
                        setShow(e.target.checked);
                    }}
                />
                &nbsp;
                사진이 안보여요
            </label>
            <br/>
            {!show && <img alt=''src={photo} width={300} border='10' />}
        </div>
    );
}

export default FourComponent;
