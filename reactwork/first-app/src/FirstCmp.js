import React,{Component} from "react";
import img1 from './1.png';
import img2 from './image/2.jpg';

//class 로 컴포넌트 생성하기
class FirstCmp extends Component {
    constructor(props) {
      super(props);
      this.state = {
        isTankImageVisible: false, // Track the visibility of the tank image
      };
    }
  
    toggleTankImage = () => {
      this.setState((prevState) => ({
        isTankImageVisible: !prevState.isTankImageVisible,
      }));
    };
    render(){
        const { isTankImageVisible } = this.state;
        return (
            <div>
                <h2 style={{color:'black',border:'2px solid orange',backgroundColor:'PINK'}}>
                    React 첫 컴포넌트 wwwwww
                </h2>
                <h5>src의 이미지 나타내기</h5>
                <img src={img1} alt="히오스" style={{width:'100px'}}/>
                <br></br><img src={img2} alt="프로브" style={{width:'100px'}}/>
                {/*public 이미지의 경우 상대 주소 전부 입력 */}
                <h4>public의 이미지 나타내기(클릭하면 시즈모드)</h4>
                <img alt="탱크" src={isTankImageVisible ? "./1212.png" : "./121212.png"}
                style={{ width: '200px' }}onClick={this.toggleTankImage}/>
            </div>

        ) 
    }
}
//default 로 export 할 경우  import 시 에 이름을 마을대로 정할 수 있다.
//export default는 파일내에서 한번만 가능
// export default FirstCmp;

//이렇게 export 한 경우 import시 똑같은 이름만 가능
export {FirstCmp};

