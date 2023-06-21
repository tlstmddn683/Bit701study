import * as React from 'react';

function SixRowItem(ele) {
    return (
        <div style={{marginBottom:'10px',width:'400px',height:'70px',border:'3px solid gray'}}>
            <b>이름 : {ele.irum}</b>
            <b style={{marginLeft:'10px'}}>휴대전화 : {ele.hp}</b>
            <b style={{marginLeft:'10px'}}>혈액형 : {ele.blood}</b>
        </div>
        
    );
}

export default SixRowItem;