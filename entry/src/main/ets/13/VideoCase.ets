@Entry
@Component
struct VideoCase {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Tabs() {
        TabContent() {
          Video({
            src: 'https://video19.ifeng.com/video09/2024/05/23/p7199260608686989961-0-122707.mp4'
          })
        }.tabBar('在线视频')
        TabContent() {
          Video({
            src: $rawfile('1.mp4')
          })
        }.tabBar('本地视频')
      }

    }
    .height('100%')
    .width('100%')
  }
}