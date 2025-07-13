@Entry
@Component
struct Image1Page {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column({space: 20}) {
        Image('https://foruda.gitee.com/avatar/1705232317138324256/1759638_itcast_panpu_1705232317.png')
          .width(100)
        Image($r('app.media.a'))
          .width(100)
        Image($r('sys.media.save_button_picture'))
          .width(100)
          .fillColor(Color.Red)
        Image($r('app.media.ic_Wechat'))
          .width(100)
          .fillColor(Color.Green)
      }
      .width('100%')
    }
    .height('100%')
  }
}