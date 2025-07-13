
// 全局builder
@Builder
function MyBuilderOption(item: string) {
  Row() {
    Text(`${item}.选项`)
      .width('100%')
      .padding(20)
  }
}

@Entry
@Component
struct BuilderPage {
  @State message: string = 'Hello World';
  @State list: string[] = ['A', 'B']
  @State list1: string[] = ['C','D']

  // 局部builder
  @Builder
  MyBuilderFunction(item: string) {
    Row() {
      Text(`${item}.选项`)
        .width('100%')
        .padding(20)
    }
  }

  build() {
    Row() {
      Column() {
        // Row() {
        //   Text('A.选项')
        //     .width('100%')
        //     .padding(20)
        //     .backgroundColor(Color.Pink)
        // }
        // Row() {
        //   Text('B.选项')
        //     .width('100%')
        //     .padding(20)
        // }
        //
        // Row() {
        //   MyBuilderOption()
        // }
        ForEach(this.list, (item: string) => {
          MyBuilderOption(item)
        })
        ForEach(this.list1, (item: string) => {
          this.MyBuilderFunction(item)
        })
      }
      .padding(20)
      .width('100%')
    }
    .height('100%')
  }
}

