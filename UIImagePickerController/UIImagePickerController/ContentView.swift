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
            Button("사진 선택") {
                showingImagePicker = true
            }
        }
        // .sheet를 .fullScreenCover로 변경
        // present 여부를 $showingImagePicker로 결정함
        // .sheet나 .fullScreenCover를 사용하면, 해당 뷰를 닫을 때 자동으로 isPresented와 연결된 변수 false로 설정
        .fullScreenCover(isPresented: $showingImagePicker, onDismiss: loadImage) {
            // 이미지 피커를 표시
            ImagePicker(image: $inputImage)
        }
    }

    /// 이미지가 선택되고, ImagePicker가 dismiss되면 실행되는 함수
    func loadImage() {
        // 이미지를 저장하거나 처리하려면 여기에서 수행
    }
}
//
struct ImagePicker: UIViewControllerRepresentable {
    /// 뷰의 presentation 상태에 접근하는 데 사용된다. 뷰를 닫는 동작을 처리하기 위해 사용
    @Environment(\.presentationMode) var presentationMode
    /// 선택한 이미지를 저장하는  변수. 다른 뷰와 값이 동기화되어야 하므로 @Binding이 사용됨
    @Binding var image: UIImage?

    // UIViewControllerRepresentable에 정의되어 있음
    // UIViewController 객체가 생성됨과 동시에 호출, Coordinator 객체를 생성
    func makeCoordinator() -> Coordinator {
        // init 메서드에 자신(ImagePicker)넣음
        Coordinator(self)
    }

    // UIViewControllerRepresentable을 채택한 뷰가 생성될 때 호출
    // UIImagePickerController를 생성하고 반환
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        // delegate를
        picker.delegate = context.coordinator
        // picker.sourceType = .camera
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
