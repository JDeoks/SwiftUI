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