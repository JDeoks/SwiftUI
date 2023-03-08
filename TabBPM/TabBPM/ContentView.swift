//
//  ContentView.swift
//  TabBPM
//
//  Created by 서정덕 on 2023/03/08.
//

import SwiftUI
import AVKit

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
    var body: some View {
        VStack(spacing: 20) {
             Button {
                 SoundSetting.instance.playSound()
                 //some action 1
             } label: {
                 Text("hihatSound")
             }
             
         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
