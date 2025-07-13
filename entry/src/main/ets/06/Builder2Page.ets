@Entry
@Component
struct Builder2Page {
  @State message: string = 'Hello World';
  // builder改变值的条件：
  // 1.必须有state修饰
  // 2.必须使用{}传递
  @State dataTime: string = '05-13'
  @Builder
  MyLayoutBuilder(leftString: string, rightString: string = '123') {
  Row() {
    Text(leftString)
    Text(rightString)
  }
  .width('100%')
  .padding(20)
  .justifyContent(FlexAlign.SpaceBetween)
  .backgroundColor(Color.Pink)
  .borderRadius(8)
    // builder内部不允许改变值
    // .onClick(() => {
    //   leftString = '3r3rde'
    // })
}
  @Builder
  MyLayoutBuilder1(dataInfo: DataInfo) {
    Row() {
      Text(dataInfo.leftText)
      Text(dataInfo.rightText)
    }
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.Pink)
    .borderRadius(8)
    // builder内部不允许改变值
    // .onClick(() => {
    //   leftString = '3r3rde'
    // })
  }

  build() {
    Row() {
      Column({space: 10}) {
        Text(this.dataTime)
        // 只要使用{}传值才能是响应式，直接传字符串就是值传递
        this.MyLayoutBuilder('异常时间', this.dataTime)
        this.MyLayoutBuilder1({
          leftText: '异常时间',
          rightText: this.dataTime
        })
        Button('修改时间')
          .onClick(() => {
            this.dataTime = '05-14'
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}

interface DataInfo {
  leftText: string
  rightText: string
}