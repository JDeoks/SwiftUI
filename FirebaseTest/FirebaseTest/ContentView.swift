//
//  ContentView.swift
//  FirebaseTest
//
//  Created by 서정덕 on 2023/05/18.
//

import SwiftUI
import FirebaseStorage
import Firebase

struct ContentView: View {
    @State private var image: UIImage? = UIImage(systemName: "trash")
    @State private var mode = String(0)
    @State private var uid: String = UIDevice.current.identifierForVendor?.uuidString ?? ""
    
    func uploadImage() {
        guard let image = image else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let uniqueFilename = UUID().uuidString + ".jpg" // 유니크한 파일 이름 생성
        let imagePath = "Original/\(mode)/\(uid)/\(uniqueFilename)" // 이미지 파일 경로 구성
        
        let imageRef = storageRef.child(imagePath)
        
        imageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("이미지 업로드 실패: \(error.localizedDescription)")
            } else {
                print("이미지 업로드 성공!")
            }
        }
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image ?? UIImage(systemName: "folder")!)
                .resizable()
                .frame(width: 200, height: 200)
            
            TextField("모드 입력", text: $mode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("이미지 업로드") {
                uploadImage()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
