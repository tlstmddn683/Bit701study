import React from 'react';
import './MyStyle.css';

function ThirdCmp(props) {
    const style1={
        fontFamily:'East Sea Dokdo',
        fontSize:'26px',
        color:'purple',
        border:'1px solid gray',
        backgroundColor:'#55ccaa'
    }
    const style2={
        textAlign:'center',
        border:'5px solid gray',
        width:'200px',
        height:'150px',
        marginLeft:'250px'
    }

    let myName="승우";
    let myAddr="경기도 광명시";
    return (
        <div>
            <h6 style={style1}>세번째 깜뽀난뚜</h6>
            <div style={style2}>
                이름:{myName}<br/>
                주소:{myAddr}
            </div>
        </div>
    );
}

export default ThirdCmp;