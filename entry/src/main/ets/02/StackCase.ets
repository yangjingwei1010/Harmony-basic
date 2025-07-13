@Entry
@Component
struct StackCase {
  build() {
    Row() {
      Column() {
        Stack() {
          Row() {
          }
          .width(300)
          .height(300)
          .backgroundColor(Color.Blue)
          Row() {
            Image('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png')
              .width(160)
            Text("鸿蒙版")
              // .offset({
              //   x: -60,
              //   y: -10
              // })
              .translate({
                x: -60,
                y: -10
              })
          }
          .justifyContent(FlexAlign.Center)
          .offset({
            x: 40
          })
          .width(200)
          .height(200)
          .backgroundColor(Color.Green)
        }
        .width(400)
        .height(400)
        .backgroundColor(Color.Pink)
      }
      .width('100%')
    }
    .height('100%')
  }
}