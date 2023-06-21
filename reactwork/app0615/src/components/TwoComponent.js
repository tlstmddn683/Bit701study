import React from 'react';
import posting from '../data/PostingData.json';

function TwoComponent(props) {
    const deal=posting.deal;

    return (
        <div>
            <h2 className='alert alert-danger'>Two Component</h2>
            {
                deal.map((data,idx)=>
                <div style={{float:'left',marginLeft:'10px'}}>
                    <figure>
                        <img alt='' src={data.img} style={{border:'1px solid gray',width:'300px'}}/>
                        <figcaption>
                            <div style={{color:'gray'}}>{data.company}</div>
                            <div style={{color:'#666'}}>{data.title}</div>
                            <b style={{color:'cyan'}}>{data.sale}</b>
                            <b style={{marginLeft:'10px'}}>{data.price}</b>
                        </figcaption>
                    </figure>
                </div>)
            }
        </div>
    );
}

export default TwoComponent;