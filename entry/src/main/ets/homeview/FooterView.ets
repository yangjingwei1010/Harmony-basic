@Preview
@Component
struct FooterView {
  build() {
    Row({space: 10}) {
      Row() {
        Text('首页')
          .fontSize(20)
      }
      .justifyContent(FlexAlign.Center)
      .width('20%')
      .height(40)
      .backgroundColor(Color.White)
      Row() {
        Text('看看')
          .fontSize(20)
      }
      .justifyContent(FlexAlign.Center)
      .width('20%')
      .height(40)
      .backgroundColor(Color.White)
      Row() {
        Text('我的')
          .fontSize(20)
      }
      .justifyContent(FlexAlign.Center)
      .width('20%')
      .height(40)
      .backgroundColor(Color.White)
    }
    .justifyContent(FlexAlign.SpaceAround)
    .width('100%')
    .height(60)
    .backgroundColor(Color.Green)
  }
}

export default FooterView