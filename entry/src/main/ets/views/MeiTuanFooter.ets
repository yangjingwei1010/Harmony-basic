
@Preview
@Component
struct MeiTuanFooter {
  build() {
    Row() {
      Text('footer')

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height(60)
    .backgroundColor(Color.Blue)
  }
}

export default MeiTuanFooter