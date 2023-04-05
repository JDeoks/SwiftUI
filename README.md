# TabView
### HomeView.swift  
배경에 Zstack, Color 로 색 넣기  
Text 폰트  
Image크기 조정,비율 고정, 원모양  클립, 내장 이미지, 색 변경

### StoryView.swift
스크롤 뷰 (패딩 넣으면 올라가면서 잘림 전체화면에는 패딩 X)  
패딩 두번 넣는 법  
이미지, 뷰에 모서리 곡률 넣기  
[뷰 그룹화](https://seons-dev.tistory.com/entry/SwiftUI-Form-Group-GroupBox) (스택 안에 10개 초과로 들어가면 오류)  
그룹에 패딩 넣으면 모든 요소에 적용  
Zstack, Color 쓰지 않고 .background, Color로 색 넣기

### FavoritesView.swift
Spacer 사용 정렬  
숫자로 글자 크기 설정  
ScrollView(.horizontal) 가로 방향 스크롤 뷰  
HStack(spacing: 30)으로 요소간 띄우기  
[DisclosureGroup사용해서 계층 표시](https://zeddios.tistory.com/1179)

### FunFactsView.swift
변수, 상태 변수, Text 값 변경  
frame maxWidth로 크기 설정  
배열 랜덤 추출  
[버튼, 버튼에 RoundedRectangle 배경](https://hyerios.tistory.com/288)

### ContentView.swift  
탭뷰, [라벨 붙이기](https://seons-dev.tistory.com/entry/SwiftUI-Label%EC%82%AC%EC%9A%A9%EC%9E%90-%EB%9D%BC%EB%B2%A8%EC%8A%A4%ED%83%80%EC%9D%BC-%EB%A7%8C%EB%93%A4%EA%B8%B0)

# GridView
[그리드?](https://zeddios.tistory.com/1179)
### ContentView.swift
[ForEach 구조체](https://medium.com/hcleedev/swift-swiftui%EC%9D%98-foreach-%EC%95%8C%EC%95%84%EB%B3%B4%EA%B8%B0-%EC%A0%95%EC%9D%98-%EC%82%AC%EC%9A%A9-%ED%8C%81-8790117e6fd9)
,[ Identifiable](https://ios-development.tistory.com/585)  
[키패스(KeyPath)](https://pinelover.tistory.com/273)  
그리드 뷰  
[.aspectRatio로 뷰 가로 세로 비율 조정](https://lazyowl.tistory.com/entry/SwiftUI-AspectRatio-%EB%84%88%EB%B9%84-%EB%86%92%EC%9D%B4-%EB%B0%B0%EC%9C%A8)
, [.contentmode()로 채우기 방식](https://hyerios.tistory.com/35)  
버튼에 label로 도형 넣기  
Image.colorMultiply로 이미지에 색 덧입히기

# SymbolGrid
[Identifiable, Equatable 프로토콜](https://coding-rengar.tistory.com/47)  
[UUID()](https://medium.com/@jang.wangsu/ios-swift-uuid%EB%8A%94-%EC%96%B4%EB%96%A4-%EC%9B%90%EB%A6%AC%EB%A1%9C-%EB%A7%8C%EB%93%A4%EC%96%B4%EC%A7%80%EB%8A%94-%EA%B2%83%EC%9D%BC%EA%B9%8C-22ec9ff4e792)
### ContentView.swift
[NavigationStack](https://zeddios.tistory.com/1376)  
스택안에 Title 넣음   
[NavigationLink](https://seons-dev.tistory.com/entry/NavigationView)는 넘어가는 뷰와 링크 표시방식인 lable로 구성  
[@State](https://medium.com/harrythegreat/swiftui-%ED%8A%9C%ED%86%A0%EB%A6%AC%EC%96%BC-5%ED%8E%B8-state-binding-observedobject-83c00c3317cb): 변수가 변경 될 때마다 body를 다시 렌더링  
[@Binding과 @State의 차이:](https://medium.com/harrythegreat/swiftui-%ED%8A%9C%ED%86%A0%EB%A6%AC%EC%96%BC-5%ED%8E%B8-state-binding-observedobject-83c00c3317cb)  
[Source of Truth(SOT)](https://velog.io/@qwer15417/SwiftUI-%EB%B7%B0-%EC%82%AC%EC%9D%B4%EC%9D%98-%EB%8D%B0%EC%9D%B4%ED%84%B0-%ED%9D%90%EB%A6%84-%EA%B4%80%EB%A6%AC)  
[toggle()](https://jusung.github.io/Bool-%EA%B0%92%EC%9D%84-%EB%B0%98%EC%A0%84%EC%8B%9C%ED%82%A4%EB%8A%94-toggle()/): Bool값 변경시키는 함수  
### SymbolPicker.swift

![waving](https://capsule-render.vercel.app/api?type=Waving&height=300&width=200&text=JUNGKKEOKMA&desc=Wut%20matters%20is%20the%20indomitable%20spirit&descAlignY=60&fontAlign=50&fontSize=50&fontAlignY=40&color=gradient&animation=fadeIn&fontColor=#d1d1d1)

<h1><img src="https://user-images.githubusercontent.com/76584961/216099537-e1b5f736-96a4-4dee-94f3-5f040a105cfa.gif" style="height: 30px"/> Hello, There!</h1>

<img align="right" src="https://user-images.githubusercontent.com/76584961/216432124-bd562e56-0bc3-495d-8585-b60ad15e5033.gif" style="max-width: 100%; width: 250px; display: inline-block;"/>

<p>I'm Seogun, <code>Front-end</code> developer from Korea. I use React often.</p>
<p>🕐 <code>Jan 09, 2022</code> ~ <code>April 28, 2023</code> <b>향해99 부트캠프 12기 진행중</b> &nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/76584961/216518470-88179044-bd5d-47b4-9a02-6224b29f5fa3.gif" style="height: 30px"/></p>

<!--<a href="https://hanghae99.spartacodingclub.kr/?utm_source=google&utm_medium=bs&utm_campaign=%ED%95%AD%ED%95%B4&utm_content=%ED%95%AD%ED%95%B4_%EB%B8%8C%EB%9E%9C%EB%93%9C&utm_term=%ED%95%AD%ED%95%B499&gclid=Cj0KCQiA2-2eBhClARIsAGLQ2RkbCk1fDiRiZggpA67f2tpNi9k9xPbEjybYrKfttpH0JnpLDRQZeCUaApoSEALw_wcB" target=_blank rel=noopener noreferrer><img src="https://user-images.githubusercontent.com/76584961/216495125-eee030e7-812b-427f-a765-76b495b4346c.png"  style="height: 30px"/></a> -->
<br />
<a href="https://hits.seeyoufarm.com"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FSeogun95&count_bg=%23C8A03D&title_bg=%23555555&icon=git.svg&icon_color=%23FFFFFF&title=Seogun95&edge_flat=false"/></a>

<h2>MY TECH STACK <img src="https://user-images.githubusercontent.com/76584961/217931497-5525468d-4682-4e93-aaae-fcad0a1b9840.gif" style="height: 30px"/></h2>

<p>
   <img width="30" src="https://user-images.githubusercontent.com/76584961/216093017-3e1770bb-a305-492b-b0f7-c12e7935fae4.png" alt="css">
   <img width="30" src="https://user-images.githubusercontent.com/76584961/216093342-7b2cdcf6-9150-4b30-aedd-d5f79b1f44c8.png" alt="html">
   <img width="30" src="https://user-images.githubusercontent.com/76584961/216442416-85fcfa93-7512-4b9e-9ff4-1f3b4a9a6567.gif" alt="js">
   <img width="30" src="https://user-images.githubusercontent.com/76584961/216117810-7c78b892-cb2b-4050-8911-f51ae15cb85e.png" alt="swift">
   <img width="30" src="https://user-images.githubusercontent.com/76584961/216117822-e83f9b0c-3e41-44ac-9da9-05ecf3494c99.png" alt="swiftui">
   <img width="30" src="https://user-images.githubusercontent.com/76584961/216093353-d6b5485d-8e51-4f85-a090-552d8cb122ca.png" alt="typescript">    
   <img width="30" src="https://user-images.githubusercontent.com/76584961/218177725-96163589-fe2d-46ee-87b8-554b1b085260.png" alt="react"> 
   <img width="30" alt="styled" src="https://user-images.githubusercontent.com/76584961/218177308-36505717-ca4c-4da9-bb04-ffefa5ace9aa.png">
   <img width="30" alt="scss" src="https://user-images.githubusercontent.com/76584961/218178822-3037b0b3-07cc-486c-bda4-eb254eabe85a.png">
 
<!--<img style="width: 50px;" src="https://user-images.githubusercontent.com/76584961/216094038-441f7d64-1d02-4301-917c-6999c9f9723e.png" alt="bootstrap"> -->
</p>

[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=Seogun95&layout=compact)](https://github.com/anuraghazra/github-readme-stats)


<h2>🛠️ TOOLS 🛠️</h2>
<p>   <img style="width: 40px;" alt="vscode" src="https://user-images.githubusercontent.com/76584961/216272325-ac8b1a90-41ae-42f9-84f9-b9ad9a485a6f.png">
<img style="width: 40px;" alt="xcode" src="https://user-images.githubusercontent.com/76584961/216272330-0370238a-e7a8-48df-8d39-28c5cd5c9612.png">
<img style="width: 40px;" alt="iterm2" src="https://user-images.githubusercontent.com/76584961/216276408-bfcaaff4-a516-4b63-9948-1508885f00a0.png">
<img style="width: 40px;" alt="terminal" src="https://user-images.githubusercontent.com/76584961/216279126-7cfa9d77-554a-4753-a600-5e6166074248.png">
<img style="width: 40px;" alt="typora" src="https://user-images.githubusercontent.com/76584961/216277590-ac90afd4-ed05-483f-862a-357c840eae79.png">
<img style="width: 40px;" alt="opcidian" src="https://user-images.githubusercontent.com/76584961/216277688-233c8c2c-2762-4a6a-b7e4-d2ba697841b3.png">
</p>

---

<h2>A LITTLE MORE ABOUT ME USING CODE</h2>

```javascript
const seogun = {
  gender: "male",
  location: 'KOREA' | '대한민국 🇰🇷',
  language: ['한국어', 'Русский', 'English'],
  code: [HTML, CSS, Javascript, Typescript],
  tools: [React, Styled-Components]
}
```

------
<h2>PROJECT</h2>


------
<h2>WHERE TO FIND ME?</h2>

<p align="center">Follow me on Instagram! <img alt="instagram" src="https://user-images.githubusercontent.com/76584961/216097483-1682634a-25ea-45ba-a112-9993858197d5.png" style="width: 20px"> <a href="https://www.instagram.com/suun_dal_95/" target="_blank" rel="noopener noreferrer">@suun_dal_95</a>
  </p>
<p align="center">이 <i>README</i> 파일의 마지막 업데이트 날짜: <br><code>2023년 02월 25일(토) 04시 19분</code></p>
  <p align="center"><img src="https://user-images.githubusercontent.com/76584961/216103441-02b488d1-cf51-4c47-afae-ddc6fbec868e.gif" style="height: 40px"/><a href="https://github.com/Seogun95" target=_blank rel=noopener noreferrer style="cursor: pointer;"><img alt="Github" src="https://user-images.githubusercontent.com/76584961/216338764-0852c2aa-60ff-47e5-ab06-653a4101f8c6.png" style="height: 40px"></a> 
<a href="https://seons-dev.tistory.com/" target=_blank rel=noopener noreferrer style="cursor: pointer;"><img alt="tistory" src="https://user-images.githubusercontent.com/76584961/216338770-66ee5516-a55d-4526-a5b0-386995b215ea.png" style="height: 40px"></a> 
</p>



<img style="width: 40px;" alt="vscode" src="https://user-images.githubusercontent.com/76584961/216272325-ac8b1a90-41ae-42f9-84f9-b9ad9a485a6f.png">
<img style="width: 40px;" alt="xcode" src="https://user-images.githubusercontent.com/76584961/216272330-0370238a-e7a8-48df-8d39-28c5cd5c9612.png">