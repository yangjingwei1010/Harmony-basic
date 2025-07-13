import { ReplyItem, ReplyItemModel } from '../models'


@Component
struct ZhihuComment {

  @ObjectLink
  item: ReplyItemModel

  build() {
    Row({ space: 10 }) {
      Image(this.item.avatar)
        .width(40)
        .height(40)
        .borderRadius(20)

      Column({ space: 10 }) {
        Text(this.item.author)
          .fontColor("#303a43")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)

        Text(this.item.content)
          .fontColor("#2f3642")
          .lineHeight(22)
        Row() {
          Text(`${this.item.time} .IP${this.item.area}`)
            .fontColor("#cacaca")
            .fontSize(12)

          Row({ space: 4 }) {
            Image($r("app.media.ic_like"))
              .width(12)
              .height(12)
              .fillColor(this.item.likeFlag ? Color.Red : "#cacaca")

            Text(this.item.likeNum.toString())
              .fontColor(this.item.likeFlag ? Color.Red : "#cacaca")
              .fontSize(12)
          }
          .onClick(() => {
            if (this.item.likeFlag) {
              this.item.likeNum--
            } else {
              this.item.likeNum++
            }
            this.item.likeFlag = !this.item.likeFlag
          })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

    }
    .alignItems(VerticalAlign.Top)
    .padding(20)
    .width('100%')
  }
}

export {
  ZhihuComment
}