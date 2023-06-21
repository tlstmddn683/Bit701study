import React from 'react';

function SevenChildApp2({name,price,photo}) {
    return (
        <div>
            <h5 className='alert alert-danger' 
            style={{border:'3px solid pink',fontFamily:'Jua',marginBottom:'10px'}}>
                이름:{name} ,가격:{price},<img className='App-logo' alt='' src={require(`../image/${photo}`)}/>
            </h5>
        </div>
    );
}

export default SevenChildApp2;