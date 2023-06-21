import React from 'react';
//방법1 {props.name} 처럼 읽어오기
// function SevenChildApp(props) {
//     return (
//         <div>
//             <h5 className='alert alert-danger' style={{border:'3px solid pink',fontFamily:'Jua',marginBottom:'10px'}}>
//                 사탕이름:{props.name} ,나이:{props.age}세
//                 <button type='button' className='btn btn-info btn-sm' onClick={props.onIncre}>증가</button>
//                 </h5>
//         </div>
//     );
// }
//방법 2 props로 묶어서 읽어오기
// function SevenChildApp(props) {
//     const{name,age,onIncre}=props;

//     return (
//         <div>
//             <h5 className='alert alert-danger' style={{border:'3px solid pink',fontFamily:'Jua',marginBottom:'10px'}}>
//                 사탕이름:{name} ,나이:{age}세
//                 <button type='button' className='btn btn-info btn-sm' 
//                 onClick={onIncre}>증가</button>
//                 </h5>
//         </div>
//     );
// }
//방법 3 props 자리에 원하는 값 넣기
function SevenChildApp({name,age,onIncre}) {

    return (
        <div>
            <h5 className='alert alert-danger' style={{border:'3px solid pink',fontFamily:'Jua',marginBottom:'10px'}}>
                사탕이름:{name} ,나이:{age}세
                <button type='button' className='btn btn-info btn-sm' 
                onClick={onIncre}>증가</button>
                </h5>
        </div>
    );
}
export default SevenChildApp;