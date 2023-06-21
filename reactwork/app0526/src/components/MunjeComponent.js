import React, { useState } from 'react';
import food from '../image/7.jpg';
import food2 from '../image/1.jpg';
import food3 from '../image/2.jpg';
import food4 from '../image/3.jpg';
import food5 from '../image/4.jpg';

function MunjeComponent(props) {
  const [photo, setPhoto] = useState(food);
  const [show, setShow] = useState(false);
  const [border, setBorder] = useState('5px solid gray');
  const [width, setWidth] = useState(300);
  const [height, setHeight] = useState(300);
  const[txt,settxt]=useState("안뇽");
  
  const changePhoto = (e) => {
    setPhoto(e.target.value);
  };

  const changeBorder = (e) => {
    setBorder(e.target.value);
  };

   const increaseSize = () => {
    setWidth((prevWidth) => prevWidth + 10);
    setHeight((prevHeight) => prevHeight + 10);
  };

  const decreaseSize = () => {
    setWidth((prevWidth) => prevWidth - 10);
    setHeight((prevHeight) => prevHeight - 10);
  };


  return (
    <div>
      <hr />
      <h5 style={{ border: '3px solid gray', backgroundColor: '#add8e6' }}>
        Munje Component 실습
      </h5>
      <label>
        <input
          type="checkbox"
          onClick={(e) => {
            setShow(e.target.checked);
          }}
        />
        숨김
      </label>
      &nbsp;
      <button
        type="button"
        className="btn btn-outline-danger"
        onClick={decreaseSize}
      >
        점점작게
      </button>
      &nbsp;
      <button
        type="button"
        className="btn btn-outline-danger"
        onClick={increaseSize}
      >
        점점크게
      </button>
      <br /><br/>
      <input type='text' className='form-control' style={{ width: '200px', marginLeft: '50px' }}
            placeholder='엔터눌러봥'
            onKeyUp={(e)=>{
                if(e.key==='Enter'){
                    settxt(e.target.value);
                }
            }}/>
            <br/>
        <div>
        <select
          className="form-select"
          style={{ width: '200px', marginLeft: '50px' }}
          onChange={changePhoto}
        >
          <option selected value={food}>
            괴식
          </option>
          <option value={food2}>샌드위치</option>
          <option value={food3}>꼬치구이</option>
          <option value={food4}>육칼</option>
          <option value={food5}>스튜</option>
        </select>
        <br />
        <select
          className="form-select"
          style={{ width: '200px', marginLeft: '50px' }}
          onChange={changeBorder}
        >
          <option selected value="5px solid gray">5px solid gray</option>
          <option value="5px inset gray">5px inset gray</option>
          <option value="5px groove gray">5px groove gray</option>
          <option value="5px outset gray">5px outset gray</option>
          <option value="5px dotted gray">5px dotted gray</option>
        </select>
        {!show && (
          <img
            alt=""
            src={photo}
            style={{
              position: 'absolute',
              left: '300px',
              width: `${width}px`,
              height: `${height}px`,
              clear: 'both',
              border: border,
            }}
          />
        )}
        <br/>
        <h4 className='one two'>{txt}</h4>
      </div>
    </div>
  );
}

export default MunjeComponent;
