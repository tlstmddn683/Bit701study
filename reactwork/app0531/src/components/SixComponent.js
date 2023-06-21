import React, { useState } from 'react';
import SixWriteForm from './SixWriteForm';
import SixRowItem from './SixRowItem';

function SixComponent(ele) {
    const[data,setData]=useState([
      {"irum":"마이클","blood":"O","hp":"010-2222-3333"},
      {"irum":"캐서린","blood":"AB","hp":"010-1111-3333"}
    ]);
    const addDataEvent=(item)=>{
      setData(data.concat(item));

    }
    return (
        <div>
            <h2 className='alert alert-success'>Six Component</h2>
            <SixWriteForm addData={addDataEvent}/>
            <hr/>
            <h5>{data.length}명 등록완료</h5>
            {
              data.map((ele,idx)=><SixRowItem key={idx} idx={idx} ele={ele}/>)
            }
            
        </div>
        
    );
}

export default SixComponent;