@Preview
@Component

struct HeaderView {
  build() {
    Row() {
      Text('首页')
    }
    .width('100%')
    .height(60)
    .backgroundColor(Color.Red)
    .justifyContent(FlexAlign.Center)
  }
}

export default HeaderView