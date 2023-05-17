//
//  ContentView.swift
//  PostImage
//
//  Created by 서정덕 on 2023/05/15.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            } else {
                Text("No image selected")
            }
            
            Button("Select Image") {
                isShowingImagePicker = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button("Upload") {
                uploadImage()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(selectedImage == nil)
        }
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePickerView(selectedImage: $selectedImage)
        }
    }
    
    func uploadImage() {
        // selectedImage nil 이면 그대로 리턴
        guard let image = selectedImage else {
            return
        }
        // image jpegData로 변환
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            return
        }
        /// 서버의 업로드 URL
        let url = URL(string: "http://example.com/upload")!
        /// URLRequest 객체를 생성, 요청할 URL 저장
        var request = URLRequest(url: url)
        // POST 메서드로 설정
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        let contentType = "multipart/form-data; boundary=\(boundary)"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 서버로부터의 응답 처리
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
                // 서버 응답에 따른 처리
            }
            
            if let data = data {
                // 서버 응답 데이터 처리
                let responseString = String(data: data, encoding: .utf8)
                print("Response data: \(responseString ?? "")")
            }
        }
        
        task.resume()
    }
}


struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage? // 선택한 이미지를 가져오기 위한 바인딩
    
    @Environment(\.presentationMode) var presentationMode // 프리젠테이션 모드로 선택기를 닫음
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController() // 새로운 이미지 선택기 생성
        imagePicker.sourceType = .photoLibrary // 소스 타입을 포토 라이브러리로 설정
        imagePicker.delegate = context.coordinator // 델리게이트를 코디네이터로 설정
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // 뷰 컨트롤러를 업데이트할 필요가 없음
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self) // self에 대한 참조를 가진 코디네이터 생성
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePickerView // 부모 ImagePickerView에 대한 참조
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage { // 선택한 이미지 가져오기
                parent.selectedImage = image // 선택한 이미지를 부모의 바인딩에 설정
            }
            parent.presentationMode.wrappedValue.dismiss() // 선택기 닫기
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
