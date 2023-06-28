import SwiftUI

var images: [UIImage] = [] // Initialize with empty array


class GalleryData: ObservableObject {
    @Published var isExpanded = false
    @Published var galleryCurrentIndex = 0
    let dragNumber: Int = 35
    let buttonScale = 1.5
    let galleryHeight = 0.31 * UIScreen.screenHeight
    var images: [UIImage] {
        parkImages(parkID: "\(parksData[parkN].id)")
    }

    func showNextImage() {
        withAnimation {
            galleryCurrentIndex = (galleryCurrentIndex + 1) % images.count
        }
    }

    func showPreviousImage() {
        withAnimation {
            galleryCurrentIndex = (galleryCurrentIndex - 1 + images.count) % images.count
        }
    }
}

struct GalleryView: View {
    @ObservedObject var galleryData = GalleryData()
    @Environment(\.dismiss) private var dismiss
    @State var isExpanded = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    Image(uiImage: galleryData.images[galleryData.galleryCurrentIndex])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: galleryData.galleryHeight)
                        .onTapGesture {
                            isExpanded = true
                        }
                        .gesture(
                            DragGesture()
                                .onEnded { value in
                                    if value.translation.width < -CGFloat(galleryData.dragNumber) {
                                        galleryData.showNextImage()
                                    } else if value.translation.width > CGFloat(galleryData.dragNumber) {
                                        galleryData.showPreviousImage()
                                    }
                                }
                        )
                    NavigationLink(destination: GalleryViewExpand(galleryData: galleryData), isActive: $isExpanded) {
                        EmptyView()
                    }
                }

                HStack {
                    Button(action: { galleryData.showPreviousImage() }, label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.red)
                            .scaleEffect(galleryData.buttonScale)
                            .padding(10)
                    })
                    Spacer()
                    Button(action: { galleryData.showNextImage() }, label: {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.red)
                            .scaleEffect(galleryData.buttonScale)
                            .padding(10)
                    })
                }
            }
        }
    }
}

struct GalleryViewExpand: View {
    @ObservedObject var galleryData: GalleryData
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            ZStack {
                Image(uiImage: galleryData.images[galleryData.galleryCurrentIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.screenHeight, alignment: .center)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if value.translation.width < -CGFloat(galleryData.dragNumber) {
                                    galleryData.showNextImage()
                                } else if value.translation.width > CGFloat(galleryData.dragNumber) {
                                    galleryData.showPreviousImage()
                                }
                            }
                    )
                    
            }
        }
        .frame(width: UIScreen.screenWidth,height: UIScreen.screenHeight, alignment: .top)
        .background(Color.yellow)
                 
    }
}

struct SlidingGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
