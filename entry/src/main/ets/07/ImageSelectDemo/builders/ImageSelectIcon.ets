@Builder
export function ImageSelectBuilder() {
  Column() {
    Image($r('sys.media.ohos_ic_public_add'))
      .width('70%')
      .aspectRatio(1)
      .fillColor(Color.Gray)
  }
  .justifyContent(FlexAlign.Center)
  .width('100%')
  .aspectRatio(1)
  .backgroundColor('#f5f7f8')
  .border({
    width: 1,
    color: Color.Gray,
  })
  .borderStyle(BorderStyle.Dashed)
}