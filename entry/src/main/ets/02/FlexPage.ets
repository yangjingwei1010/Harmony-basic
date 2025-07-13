@Entry
@Component
struct FlexPage {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Flex({
          justifyContent: FlexAlign.SpaceAround,
          wrap: FlexWrap.Wrap
        }) {
          Row() {

          }
          .width(100)
          .height(200)
          .backgroundColor(Color.Red)
          Row() {

          }
          .width(150)
          .height(200)
          .backgroundColor(Color.Blue)
          Row() {

          }
          .width(120)
          .height(200)
          .backgroundColor(Color.Green)
          Row() {

          }
          .width(100)
          .height(200)
          .backgroundColor(Color.Green)
        }
        .width('100%')
      }
      .width('100%')
    }
    .height('100%')
  }
}