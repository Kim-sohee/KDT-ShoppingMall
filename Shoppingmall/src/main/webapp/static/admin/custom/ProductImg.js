/*이미지 썸네일 클래스 정의*/
class ProductImg{
	constructor(container, file, src, width, height ){
		this.container=container;
		this.file=file;
		this.src=src;
		this.width=width;
		this.height=height;
		this.wrapper = document.createElement("div");
		this.header = document.createElement("div");	 
		this.img=document.createElement("img");
		this.img.src=this.src;
		
		//style 
		this.img.style.width=this.width+"px";
		this.img.style.height=this.height+"px";
		
		this.wrapper.style.width=this.width+"px";
		this.wrapper.style.height=(this.height+20)+"px";
		this.wrapper.style.display="inline-block";
		this.wrapper.style.margin=2+"px";
			
		this.header.innerHTML="<a href='#'>X</a>";
		this.header.style.textAlign="right";
		
		//assemble 
		this.wrapper.appendChild(this.header);
		this.wrapper.appendChild(this.img);
		this.container.appendChild(this.wrapper);
		
		//header에 클릭 이벤트 연결
		//화살표 함수에서의 this는 자신보다 직전 상위 스코프(영역)을 접근한다.
		//따라서 아래의 화살표 함수에서의 this는 자신보다 상위 영역인 클래스의 인스턴스를 가리킴 
		this.header.addEventListener("click", (e)=>{
			//a태그를 사용자가 클릭하면, 기본적인 기능으로써, y축을 0으로 위치시키는 특징이 잇음..
			//따라서 이벤트 발생 시 기본 특징을 제거한다. 		
			e.preventDefault();//a 태그에 의해 스크롤 위로 이동하는 것 방지
			this.remove();
		});
	}	
	
	//내가 현재 붙어있는, 컨테이터로부터 나를 삭제한다 (화면에서..) 
	remove(){
		//화면에서 제거
		this.container.removeChild(this.wrapper);
		
		//배열에서도 제거 
		//현재 객체가 보유한 File이 selectedFile 배열의 몇번째 소속이 되어 잇는지 조사하여 
		//사용자가 이 객체를 지우면 , 같은 위치에 있던 File 도 제거하자 
		let index=selectedFile.indexOf(this.file);
		selectedFile.splice(index, 1);
	}
}






