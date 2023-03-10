//
//  ContentView.swift
//  TabBPM
//
//  Created by 서정덕 on 2023/03/08.
//

import SwiftUI
import AVKit
import Combine

// AVKit 사용 소리 효과 (https://seons-dev.tistory.com/entry/SwiftUI-Sound-Effects)
// 스톱워치 (https://medium.com/geekculture/build-a-stopwatch-in-just-3-steps-using-swiftui-778c327d214b)
// 싱글톤 https://babbab2.tistory.com/66
// 타이머 https://sweetdev.tistory.com/474, https://www.youtube.com/watch?v=_WJzpPgHkhg
// 색 FFACAC FFBFA9 FFEBB4 FBFFB1
// b4d8e7

class SoundSetting: ObservableObject {
    
    //1. soundSetting의 단일 인스턴스를 만듬
    /// singleton ? :
    /*싱글 톤은 한 번만 생성 된 다음 사용해야하는 모든 곳에서 공유해야하는 객체입니다 */
    static let instance = SoundSetting()
    // 음익 재생 위한 변수 옵셔널로 추가
    var player: AVAudioPlayer?
    
    func playSound() {
        // 사운드 url
        guard let url = Bundle.main.url(forResource: "Hihat", withExtension: ".wav") else { return }
        // 오류 캐치
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("재생하는데 오류가 발생했습니다. \(error.localizedDescription)")
        }
    }
    
}

enum d {
    case d
    case f
}

struct ContentView: View {
    //진행 초
    
    /// 누르는 간격
    @State private var progressTime: Int = 0
    
    /// 탭한 횟수
    @State var numOfTab: Int = 0
    
    /// 첫 탭인지  구분하기 위한 플래그
    @State var lastTab: Int = 0
    
    /// progressTime의 총 합
    @State var totaltime: Int = 0
    
    @State var dot: [String] = ["●  ○  ○  ○","○  ●  ○  ○","○  ○  ●  ○","○  ○  ○  ●","○  ○  ○  ○",]
    /// BPM 계산하는 연산프로퍼티. BPM = 60 * numOfTab / totaltime
    var BPM: Int {
        // bpm = 60 * numOfTab / total
        get {
            if numOfTab != 0 {
                return Int(round(6000.0 * Double(numOfTab) / Double(totaltime)))
            }
            else { return 0 }
        }
    }

    // 싱글톤
    let soundInstance = SoundSetting.instance
    @State var metIsOn: Int = 0
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State var dotNum = 0
    func tabBtn() {
        // 첫 탭에만 실행
        if lastTab == 0 {
            // lastTab에 현재시간 저장
            lastTab = 1
            progressTime = 0
        }
        else {
            numOfTab += 1
            totaltime += progressTime
            progressTime = 0
        }
        soundInstance.playSound()
    }
    func startMetronome() {
        metIsOn = 1
        while metIsOn == 1 {
            if progressTime % (6000 / BPM ) == 0 {
                soundInstance.playSound()

            }
        }
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "FFFF7E")
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("TabBPM")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text(dot[numOfTab % 4])
                        .fontWeight(.thin)
                        .font(.system(size: 50))
                    
                    


                    Text("\(BPM)")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        // 타이머를 받을 때 마다 안의 클로저 실행
                        .onReceive(timer) { _ in
                            progressTime += 1
                        }
                        .frame(width: 80,height: 45)
                        .padding()
                        .background(Color(hex: "BDF6FE"))
                        .cornerRadius(20)
                        .padding()

                    Text("numOfTab: \(numOfTab)")
                    Text("totaltime: \(totaltime)")
                    Text("progressTime: \(progressTime)")
                        
                    HStack {
                        Spacer()
                        Button {
                            tabBtn()
                        } label: {
                            Text("HihatSound")
                        }
                        Spacer()
                        Button {
                           //초기화 함수
                            numOfTab = 0
                            totaltime = 0
                            lastTab = 0
                            progressTime = 0
                        } label: {
                            Text("reset")
                        }
                        Spacer()
                        Button{
                            startMetronome()
                        } label: {
                            Text("metStart")
                        }
                        
                    }
                    .padding()
                    Spacer()
                     
                }
//                .foregroundColor(Color(hex: "665FD1"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            tabBtn()
                        } label: {
                            Image(systemName: "gobackward")
//                                .foregroundColor(Color(hex: "FFACAC"))
                        }
                    }
                }
                

                
            }
        }
        
    }
}


struct metronome: View {
    @State var dotNum: Int!
    var body: some View {
        HStack{
            if dotNum == 0 {
                Image(systemName: "circle.fill")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
            }
            else if dotNum == 1 {
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle.fill")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
            }else if dotNum == 2 {
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle.fill")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
            }
            else if dotNum == 3{
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle.fill")
                    .font(.largeTitle)
                    .padding()
            }
            else {
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
                Image(systemName: "circle")
                    .font(.largeTitle)
                    .padding()
            }

        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
