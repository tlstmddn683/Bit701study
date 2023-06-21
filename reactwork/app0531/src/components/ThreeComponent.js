import React, { useState } from 'react';
import ThreeSubApp from './ThreeSubApp';

function ThreeComponent(props) {
    let [data,setData]=useState({
        photo:'2.png',
        photoName:'리눅스'

    });
    const onChangePhoto = (photo, photoName) => {
        setData({
                photo,
                photoName
        });
    }
    return (
        <div>
            <h2 className='alert alert-success'>Three Component</h2>
            <ThreeSubApp onChangePhoto={onChangePhoto}/>
            <hr/>
            <h3><b>{data.photoName}</b></h3>
            <br/><br/>
            <img alt='' src={require(`../xmas/${data.photo}`)} style={{maxWidth:'300px'}} className='App-logo'/> 
        </div>
    );
}

export default ThreeComponent;