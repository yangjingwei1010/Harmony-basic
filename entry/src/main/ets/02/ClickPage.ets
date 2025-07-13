@Entry
@Component
struct ClickPage {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column({space: 20}) {
        Row() {
          Text('1号')
        }
        .width(100)
        .height(100)
        .backgroundColor(Color.Blue)
      }
      .width('100%')
    }
    .height('100%')
  }
}