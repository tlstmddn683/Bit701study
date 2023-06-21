import React from 'react';

function FiveComponent(props) {
    const names=["장미","안개꽃","다알리아","프리지아","국화"]
    //배열 출력 방법 #1
    const nameList=names.map((item,idx)=>(<li>{idx}:{item}</li>))
    //배열 출력 방법 #2 잘안씀
    const arrloop=()=>{
        let arr=[];
        for(let i=0;i<names.length;i++){
            arr.push(<h5>{names[i]}</h5>)
        }
        return arr;
    }
    return (
        <div style={{textAlign:'left'}}>
            <h5 style={{border:'3px solid gray',backgroundColor:'#add8e6'}}>
                Five Component 실습
            </h5>
            {nameList}
            <hr/>
            {arrloop()}
            <hr/>
            {
                //출력방법 #3 직접 map으로 출력하기
                names.map((item,idx)=>(<h6 key={idx}>{idx}:{item}</h6>))
            }
            <hr/>
            {
                [...new Array(30)].map((item,idx)=><h6>{idx+1}집가고싶다 반복 레츠고</h6>)
            }
             <hr/>
            {
                [...new Array(12)].map((a,idx)=>(<img alt='' key={idx} src={require(`../image/${idx+1}.jpg`)} width={200} border={1}/>))
            }
        </div>
    );
}

export default FiveComponent;