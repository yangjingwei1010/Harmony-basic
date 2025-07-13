
enum SelectStyle {
  NoVip,
  VIP,
  SVIP
}

@Entry
@Component
struct Condition1Page {
  @State message: string = 'Hello World';
  @State selectValue: string = '未开通'
  @State selectIndex: SelectStyle = SelectStyle.NoVip

  build() {
    Row() {
      Column() {
        Row() {
          Text('开通会员:')
          Select([{value: '未开通'},{value: 'VIP'},{value: 'SVIP'}])
            .layoutWeight(1)
            .value($$this.selectValue)
            .selected($$this.selectIndex)
        }
        .width('60%')
        Row({space: 16}) {
          Image($r('app.media.b'))
            .width(30)
            .borderRadius(15)
          Text('吴彦祖')
          if (this.selectIndex === SelectStyle.NoVip) {
            Text('未开通')
              .backgroundColor('#ccc')
              .MyTextStyle()
          } else if (this.selectIndex === SelectStyle.VIP) {
            Text('VIP')
              .backgroundColor('#ffffb803')
              .MyTextStyle()
          } else if (this.selectIndex === SelectStyle.SVIP) {
            Text('SVIP')
              .backgroundColor('#ffb00909')
              .MyTextStyle()
          }
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Extend(Text)
function MyTextStyle() {
  .padding({
    top: 4,
    bottom: 4,
    left: 12,
    right: 12
  })
  .fontColor('#fff')
  .borderRadius(16)
}