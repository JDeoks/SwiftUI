//
//  ContentView.swift
//  UIImagePickerController
//
//  Created by 서정덕 on 2023/04/29.
//

import SwiftUI
import UIKit

struct ContentView: View {
    /// 이미지 피커를 보여줄지 여부를 결정하는 State
    @State private var showingImagePicker = false
    /// 선택한 이미지를 저장하는 State
    @State private var inputImage: UIImage?

    var body: some View {
        VStack {
            if let inputImage = inputImage {
                // 선택한 이미지가 있으면 화면에 표시
                Image(uiImage: inputImage)
                    .resizable()
                    .scaledToFit()
            }

            // 이미지 피커를 표시하는 버튼
            Button("Choose a photo") {
                showingImagePicker = true
            }
        }
        // .sheet를 .fullScreenCover로 변경
        .fullScreenCover(isPresented: $showingImagePicker, onDismiss: loadImage) {
            // 이미지 피커를 표시
            ImagePicker(image: $inputImage)
        }
    }

    // 이미지가 선택되면 실행되는 함수
    func loadImage() {
        // 이미지를 저장하거나 처리하려면 여기에서 수행하세요
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage? // 선택한 이미지를 저장하는 Binding 변수

    // Coordinator를 생성하는 함수
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // UIImagePickerController를 생성하고 설정하는 함수
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary // 앨범에서 이미지를 선택하도록 설정
        return picker
    }

    // 이미지 피커를 업데이트하는 함수 (본 예제에서는 필요하지 않음)
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}

    // UIImagePickerControllerDelegate와 UINavigationControllerDelegate를 구현하는 Coordinator 클래스
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        // 이미지가 선택되면 호출되는 함수
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
