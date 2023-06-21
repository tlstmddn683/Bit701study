import React, { useState } from 'react';
import EightArrayApp from './EightArrayApp';
import EightWriteApp from './EightWriteApp';

function EightComponent(props) {
    const [array,setArray]=useState([
        {"name":"김똘똘","blood":"A","addr":"독도"},
        {"name":"이똘똘","blood":"O","addr":"서울"},
        {"name":"박똘똘","blood":"AB","addr":"부산"}
    ])
    const deleteData=(idx)=>{
        setArray(array.filter((ele,i)=>i!==idx));
    }
    const addData=(data)=>setArray(array.concat(data));
    return (
        <div>
            <h2 className='alert alert-success'>EightComponent</h2>
            <EightWriteApp onSave={addData}/>
            <table className='table table-bordered' width={400}>
                <thead>
                    <tr style={{backgroundColor:'rgb(255,144,44)'}}>
                        <th width="60">번호</th>
                        <th width="70">이름</th>
                        <th width="70">혈액형</th>
                        <th width="100">주소</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        array.map((ele,idx)=>(<EightArrayApp key={idx} row={ele} idx={idx} onDelete={deleteData}/>))
                    }
                </tbody>
            </table>            
        </div>
    );
}

export default EightComponent;