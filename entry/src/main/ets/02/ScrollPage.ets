@Entry
@Component
struct ScrollPage {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Row() {

        }
        .width('100%')
        .height(50)
        .backgroundColor(Color.Red)
        Scroll() {
          Column({
            space: 20
          }) {
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
            ScrollItem()
          }
          // .height('100%')
          .width('100%')
          .backgroundColor(Color.Orange)
        }
        .layoutWeight(1)
        .height('100%')
        Row() {

        }
        .width('100%')
        .height(60)
        .backgroundColor(Color.Blue)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}

@Component
struct ScrollItem {
  build() {
    Row() {
      Text('滚动区域')
    }
    .height(100)
    .width('100%')
    .backgroundColor(Color.Pink)
  }
}