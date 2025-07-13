@Entry
@Component
struct FontJump {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Stack() {
        Text('抖音')
          .fontSize(50)
          .fontWeight(500)
          .fontColor('#ff2d83b3')
          .translate({
            x: -2,
            y: 2
          })
          .zIndex(1)
        Text('抖音')
          .fontSize(50)
          .fontWeight(500)
          .fontColor('#ffe31fa9')
          .translate({
            x: 2,
            y: -2
          })
          .zIndex(2)
        Text('抖音')
          .fontSize(50)
          .fontWeight(500)
          .fontColor('#ff030000')
          .translate({
            x: 0,
            y: 0
          })
          .zIndex(3)
      }
      .width('100%')
    }
    .height('100%')
  }
}