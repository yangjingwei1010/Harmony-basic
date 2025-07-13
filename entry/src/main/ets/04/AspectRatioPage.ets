@Entry
@Component
struct AspectRatioPage {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text($r('app.string.my_first_name'))
          .width(200)
          .aspectRatio(2/1)
          .backgroundColor(Color.Gray)
          .fontColor($r('app.color.my_first_color'))
      }
      .width('100%')
    }
    .height('100%')
  }
}