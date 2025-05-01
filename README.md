# Music-Album-lab7

# 🎵 Flutter Music Album Gallery with Hero Animation

This Flutter application showcases a visually engaging grid of music albums. Tapping an album triggers a **Hero animation**, smoothly transitioning the album cover from the gallery to a detailed view. The detail screen displays the album cover, artist name, and a list of tracks.

---

## ✨ Features

- Grid view of music albums using asset images  
- Smooth **Hero animation** for album covers  
- Detailed view with album tracks and artist name  
- Animation speed slowed using `timeDilation` for clarity  
- Responsive layout using `GridView.builder`  
- Elegant image clipping with `ClipRRect`


## 🛠️ Built With

- **Flutter SDK**
- **Dart**
- **Material Design Components**
- **Hero Animation**
- **Asset-based image loading**

---

## 📁 Project Structure Highlights

- `main.dart`: Entry point with UI for album grid and detail screens  
- `AlbumGalleryPage`: Displays albums in a `GridView`  
- `AlbumDetailPage`: Shows album info with a Hero-shared image  
- `Album` model: Holds album metadata (title, artist, image, tracks)  
- `assets/`: Contains local album cover images

---

## 🔑 Key Concepts Demonstrated

- `Hero` widget for shared element transitions  
- `ClipRRect` for rounded corners  
- `GestureDetector` for touch interactions  
- `Navigator` for screen navigation  
- `GridView.builder` and `ListTile` for dynamic UI  
- `timeDilation` to slow animation for demo purposes


## 📂 Assets

Ensure your images are placed in the `assets/` directory and declared in `pubspec.yaml` like so:

```yaml
flutter:
  assets:
    - assets/Taylor-Swift.webp
    - assets/Justin-Bieber.jpg
    - assets/Sabrina-carpenter.jpeg
    - assets/Black-pink.jpg


## 👨‍💻 Author

Made with ❤️ by **Aqsa Khan**  
