@Entry
@Component
struct Meituan {
  @State message: string = 'Hello World';

  build() {
    // Column() {
      // Row({ space: 15 }) {
      //   Column()
      //     .width(100)
      //     .height(200)
      //     .backgroundColor(Color.Blue)
      //   Column()
      //     .width(100)
      //     .height(200)
      //     .backgroundColor(Color.Red)
      //   Column()
      //     .width(100)
      //     .height(200)
      //     .backgroundColor(Color.Green)
      // }
      // .width('100%')
      // .justifyContent(FlexAlign.SpaceEvenly)

      // Column({space: 15}) {
      //   Row()
      //     .width(200)
      //     .height(100)
      //     .backgroundColor(Color.Blue)
      //   Row()
      //     .width(200)
      //     .height(100)
      //     .backgroundColor(Color.Blue)
      //   Row()
      //     .width(200)
      //     .height(100)
      //     .backgroundColor(Color.Blue)
      // }
      // .margin({top: 100})

    // }
    // .justifyContent(FlexAlign.Center)
    // .alignItems(HorizontalAlign.Center)
    // .width('100%')
    // .height('100%')
    Column({space: 10}) {
        Column()
          .width(100)
          .height(200)
          .backgroundColor(Color.Blue)
        Column()
          .width(100)
          .height(200)
          .backgroundColor(Color.Red)
        Column()
          .width(100)
          .height(200)
          .backgroundColor(Color.Green)
          .onClick(() => {
            console.log("wefe")
          })
    }
    .height('100%')
    .width('100%')
    // .justifyContent(FlexAlign.Center)
  }
}