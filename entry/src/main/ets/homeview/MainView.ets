@Preview
@Component
struct MainView {
  build() {
    Column() {
      Text('首页内容')
        .fontSize(40)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.End)
  }
}

export default MainView