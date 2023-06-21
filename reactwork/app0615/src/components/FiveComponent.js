import React, { memo, useEffect, useState } from 'react';
import FiveWriteForm from './FiveWriteForm';
import FiveRowList from './FiveRowList';
import Axios from 'axios';

function FiveComponent(props) {
    const [memoList,setMemoList]=useState([]);
    const [searchQuery, setSearchQuery] = useState('');
    
    //출력 이벤트
    const handleMemoList=()=>{
        Axios.get("/memo/list",{params : {searchQuery : searchQuery || '리액트'}})
        .then(res=>{
            setMemoList(res.data);
        })
    }

    //처음 시작시 전체 메모 출력(딱 한번)
    useEffect(()=>{
        handleMemoList();
    },[searchQuery]);

    //저장 이벤트
    const handleSaveMemo=(memo)=>{
        console.log(memo)
        Axios.post("/memo/insert",memo)
        .then(res=>{
            handleMemoList();
        })
    }

    //삭제 이벤트
    const handleDeleteMemo=(num)=>{
        const url="/memo/delete?num="+num;
        Axios.delete(url)
        .then(res=>{
            //삭제후 다시 출력
            handleMemoList();
        })
    }
    
     return (
        <div>
            <h2 className='alert alert-danger'>FiveComponent</h2>
            <FiveWriteForm onSave={handleSaveMemo}/>
            <hr/>
            <h4 className='alert aler-success'>총{memoList.length}개의 메모가 있습니다</h4>
            <input type="text" value={searchQuery} 
            onChange={(e) => setSearchQuery(e.target.value)} 
            placeholder="검색..."/>
            <hr/>
           {
            memoList.map((memo,idx)=><FiveRowList key={idx} memo={memo} onDelete={handleDeleteMemo}/>)
           }
           
        </div>
    );
}

export default FiveComponent;