import React, { useState } from 'react';

function SixComponent(props) {
    const [inputArray,setInputArray]=useState([]);
    const[data,setData]=useState({
         name:'candy',
         age:23,
         hp:'010-1234-5678',
         addr:'서울특별시 강남구'
    })
    //4개의  input 태그 입력시 호출되는 함수
    const changeData=(e)=>{
        //console.log(e.target.name);
        //console.log(e.target.value);
        const {name,value}=e.target;

        setData({
            ...data,/*나머지 데이터는 그대로 */
            [name]:value/*name에 해당하는 value만 변경*/
        })
        console.log(data)
    }
    //추가버튼 이벤트
    const addButton=()=>{
        setInputArray(inputArray.concat(data));
    }
    //초기화 버튼 이벤트
    const initButton=()=>{
        setData({
            name:'',
            age:'',
            hp:'',
            addr:''  
        });
    }
    const deleteData=(idx)=>{
        setInputArray(inputArray.filter((item,i)=>i!==idx));
    }
    return (
        <div>
            <h2 className='alert alert-success p'>SixComponent-한번에 묶어서 배열에 추가하기</h2>
            <table className='table table-bordered' style={{width:'300px',backgroundColor:'skyblue'}}>
                <caption align="top">데이터입력</caption>
                <tbody>
                    <tr>
                        <th width="100">이름</th>
                        <td>
                            <input type='text' name='name' className='form-control'
                            onChange={changeData} value={data.name}/>
                        </td>
                    </tr>
                    <tr>
                        <th width="100">나이</th>
                        <td>
                            <input type='text' name='age' className='form-control'
                            onChange={changeData} value={data.age}/>
                        </td>
                    </tr>
                    <tr>
                        <th width="100">핸드폰</th>
                        <td>
                            <input type='text' name='hp' className='form-control'
                            onChange={changeData} value={data.hp}/>
                        </td>
                    </tr>
                    <tr>
                        <th width="100">주소</th>
                        <td>
                            <input type='text' name='addr' className='form-control'
                            onChange={changeData}value={data.addr}/>
                        </td>
                    </tr>
                    <tr>
                        <td colSpan={2} align='center'> 
                            <button type='button' className='btn btn-success myButton'onClick={addButton}>데이터추가</button>
                            <button type='button' className='btn btn-danger myButton' onClick={initButton}>입력값 초기화</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <hr/>
            <table className='table table-bordered p' style={{width:'600px'}}>
                <thead>
                    <tr>
                        <th width="50">번호</th>
                        <th width="100">이름</th>
                        <th width="80">나이</th>
                        <th width="150">핸드폰</th>
                        <th width="200">주소</th>
                    </tr>
                </thead>
                <tbody>
                    {
                            inputArray.map((item,idx)=>(
                                    <tr key={idx}>
                                        <td>{idx+1}</td>
                                        <td>{item.name}</td>
                                        <td>{item.age}세</td>
                                        <td>{item.hp}</td>
                                        <td>{item.addr}</td>
                                        <td>
                                            <button type='button' className='btn btn-danger' onClick={()=>deleteData(idx)}>삭제</button>
                                        </td>
                                    </tr>
                            ))
                    }
                </tbody>
            </table>
        </div>
    );
}

export default SixComponent;