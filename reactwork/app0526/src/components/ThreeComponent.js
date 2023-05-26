import React, { useState } from 'react';
import food from '../image/7.jpg';
function ThreeComponent(props) {
    const[name,setName]=useState('');
    const[score,setScore]=useState(0);
    const[grade,setGrade]=useState('');
    const[tcolor,setTcolor]=useState('green');
    const[show,setShow]=useState('true');
    //radio click 이벤트
    const radioChangeColor=(e)=>{
        setTcolor(e.target.value)
        }
    //이름 입력 이벤트
    const changeName=(e)=>{
        setName(e.target.value);
    }
    //점수 입력 이벤트 -숫자가 아닌경우 경고후 종료
    const changeScore=(e)=>{
        if(isNaN(e.target.value)){
            alert("숫자만 입력가능");
            e.target.value='';
            return;
        }
        setScore(Number(e.target.value));
    }
    const writeGrade=(e)=>{
        if(score>=100){
            setGrade("A")

        }else if(score>=90){
           setGrade("B")

        }else if(score>=80){
            setGrade("C")

         }else{
           setGrade("F")
        } 
    }
    return (
        <div>
            <h5 style={{border:'3px solid gray',backgroundColor:'#add8e6'}}>
                Three Component 실습
            </h5>
            <h6>글자색 선택 프리즈</h6>
            <div>
                <label>
                    <input type='radio' name='tcolor' defaultValue={'red'} onClick={radioChangeColor}/>빨강
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='tcolor' defaultValue={'green'} onClick={radioChangeColor}
                    defaultChecked/>초록
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='tcolor' defaultValue={'pink'} onClick={radioChangeColor}/>핑크
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='tcolor' defaultValue={'black'} onClick={radioChangeColor}/>블랙
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type='radio' name='tcolor' defaultValue={'blue'} onClick={radioChangeColor}/>파랑
                </label>
            </div>
            <div className='input-group' 
            style={{marginTop:'30px',fontSize:'20px' ,width:'300px'}}> 
            <b>이름</b>&nbsp;
            <input type='text' className='form-control'onChange={changeName}/>
            &nbsp;&nbsp;
            <b>점수</b>&nbsp;
            <input type='text' className='form-control'onChange={changeScore}/>
            &nbsp;&nbsp;
            <button type='button' className='btn btn-outline-danger btn-sm' onClick={writeGrade}>등급계산</button>
            </div>
            <div  style={{marginTop:'30px',fontSize:'20px' ,width:'300px' ,textAlign:'left',marginLeft:'100px',color:tcolor}}>
                이 름 : {name}<br/>
                점 수 : {score} 점<br/>
                등 급 : {grade} 등급<br/>
            </div>
            <br/>
            <h5>사진 on off</h5>
            <label>
            <input type='checkbox' defaultChecked
             onClick={(e)=>{
                //alert(e.target.checked);//이벤트 true false값 
                setShow(e.target.checked);
             }}
            />
            &nbsp;
            사진이 보여요
           </label>
           <br/>
            {
             show &&
             <img alt='' src={food} width={300} border="10"/>
            }
        </div>
    );
}

export default ThreeComponent;