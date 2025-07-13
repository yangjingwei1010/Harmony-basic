@Entry
@Component
struct MyCommontPage {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Row() {
          Row() {
            Image($r('sys.media.ohos_ic_public_arrow_left'))
              .fillColor(Color.Gray)
              .width(40)
              .height(40)
          }
          .width(50)
          .height(50)
          .aspectRatio(1)
          .borderRadius(50)
          .backgroundColor(Color.Green)
          .justifyContent(FlexAlign.Center)
          Text('评论回复')
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
            .margin({right: 30})
        }
        .width('100%')
        .padding(20)
        .border({
          width: {
            bottom: 1
          },
          color: '#f5f5f5'
        })

        Row({space: 16}) {
          Image($r('app.media.a'))
            .width(60)
            .borderRadius(60)
          Column({space: 10}) {
            Text('名字')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
            Text('写布局的口诀是从上到下,从左到右,从大到小,从外往里！🔥')
            Row() {
              Text('05-10 IP:北京')
                .fontSize(12)
                .fontColor('#ccc')
              Row() {
                Image($r('app.media.ic_like'))
                  .width(16)
                  .fillColor('ccc')
                Text('100')
                  .fontSize(12)
                  .fontColor('#ccc')
              }
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
        }
        .padding(20)
        .alignItems(VerticalAlign.Top)
      }
      .width('100%')
    }
    .height('100%')
  }
}