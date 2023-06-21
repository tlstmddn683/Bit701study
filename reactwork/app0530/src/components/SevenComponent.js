import React, { useState } from 'react';
import SevenChildApp from './SevenChildApp';
import SevenChildApp2 from './SevenChildApp2';
/*
부모,자식간 통신하기
1. 부모 컴포넌트에서 자식 컴포넌트로 props를 통해 값이나 이벤트를 전달 할 수 있다.
2. 자식 컴포넌트에서는 부모컴포넌트의 값을 props로 받아서 출력은 가능하지만 직접 변경은 불가능 하다.
3. 만약 변경을 해야 된다면 props로 전달 받은 이벤트를 통해 값 변경을 할 수있다.
4. 자식 컴포넌트로 보낼 props는 부모만 정할 수 있고 자식 컴포넌트에서는 읽기만 가능(값의 경우)  
*/
function SevenComponent(props) {
    const [count,setCount]=useState(0);
    const countIncre=()=>setCount(count+1);
    return (
        <div>
            <h2 className='alert alert-success'>SevenComponent-부모자식간 통신</h2>
            <h2 className='alert alert-success'>먹은 횟수: {count} 개 먹었당</h2>
            
            <SevenChildApp name={'박하사탕'} age={80} onIncre={countIncre}/>
            <SevenChildApp name={'목캔디'} age={40} onIncre={countIncre}/>
            <SevenChildApp name={'홍삼캔디'} age={100} onIncre={countIncre}/>
            <hr/>
            <SevenChildApp2 name="파이썬" price="1000원" photo="1.png"/>
            <SevenChildApp2 name="리눅스" price="1000원" photo="2.png"/>
            <SevenChildApp2 name="히오스" price="시공의 폭풍" photo="10.png"/>
        </div>
    );
}

export default SevenComponent;