import React, { useState } from 'react';

function SixWriteForm(addData) {
    const[data,setData]=useState({irum:"" ,hp:"" ,blood:""}); 

    const changeEvent=(e)=>{
        let {name,value}=e.target;
        //입력한 항목만 변경
        setData({
            ...data,/*나머지 항목은 그대로 유지 */
            [name]:value
        })
    }
       return (
        <div>
            <div>
                이름:{data.irum}, 휴대전화:{data.hp}, 혈액형:{data.blood}형
            </div>
            이름: <input type='text' name='irum' size={5} onChange={changeEvent}/>
            &nbsp;&nbsp;
            휴대전화: <input type='text' name='hp' size={10} onChange={changeEvent}/>
            &nbsp;&nbsp;
            혈액형: <input type='text' name='blood' size={3} onChange={changeEvent}/>형
            &nbsp;&nbsp;
            <button type='button' className='btn btn-secondary' onClick={()=>addData(data)}>추가</button>
        </div>
        
    );
}

export default SixWriteForm;