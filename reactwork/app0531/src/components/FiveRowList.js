import React from 'react';

function FiveRowList(props) {
    const {row,idx}=props;
    return (
        <tr>
            <td align='center'>{idx+1}</td>
            <td align='left' style={{cursor:'pointer'}} 
                onClick={()=>props.handleClickOpen(row)}>
                {row.subject}
            </td>
            <td>{row.writer}</td>
            <td>{row.today.toLocaleDateString('ko-KR')}</td>            
        </tr>
    );
}

export default FiveRowList;