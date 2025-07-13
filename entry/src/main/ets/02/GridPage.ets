@Entry
@Component
struct GridPage {
  @State message: string = 'Hello World';

  build() {
   Row() {
     Column() {
        Grid() {
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
          MyGridItem()
        }
        .columnsTemplate('1fr 2fr')
       .rowsGap(10)
       .columnsGap(10)
     }
     .width('100%')
   }
   .height('100%')
  }
}

/// comp 快捷键创建
@Component
struct MyGridItem {
  build() {
    GridItem() {
      Column() {
        Text('grid')
      }
      .width('100%')
      .height(100)
      .backgroundColor(Color.Red)
    }
  }
}