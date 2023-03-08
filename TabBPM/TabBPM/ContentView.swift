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

struct ContentView: View {
    //진행 초
    @State private var progressTime: Int = 0
    
    // 싱글톤
    let soundInstance = SoundSetting.instance
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(progressTime)")
                .onReceive(timer) { _ in
                    progressTime += 1
                }
            Button {
                soundInstance.playSound()
                //some action 1
            } label: {
                Text("HihatSound")
            }
             
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
