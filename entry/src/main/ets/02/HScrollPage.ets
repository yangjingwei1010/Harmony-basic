@Entry
@Component
struct HScrollPage {
 scroller: Scroller = new Scroller()

  build() {
    Row() {
      Column() {
        Row() {

        }
        .backgroundColor(Color.Red)
        .width('100%')
        .height(60)
        Scroll(this.scroller) {
          Row({space: 20}) {
            ScrollItem2()
            ScrollItem2()
            ScrollItem2()
            ScrollItem2()
            ScrollItem2()
            ScrollItem2()
            ScrollItem2()
            ScrollItem2()
          }
        }
        .layoutWeight(1)
        .scrollable(ScrollDirection.Horizontal)
        .height('100%')
        .backgroundColor(Color.Blue)
        Row() {
          Button('滚动一下')
            .onClick(() => {
              this.scroller.scrollEdge(Edge.End)
            })
          Button('滚动打顶部')
            .onClick(() => {
              this.scroller.scrollEdge(Edge.Start)
            })
        }
        .backgroundColor(Color.Gray)
        .width('100%')
        .height(60)
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct ScrollItem2 {
  build() {
    Row() {
      Text('滚动区域')
    }
    .backgroundColor(Color.Pink)
    .height(200)
    .width(100)
  }
}