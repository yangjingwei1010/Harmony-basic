@Entry
@Component
struct ObjectLinkPage {
  @Prop
  good: LinkGoodItem = new LinkGoodItemModel({
    name: '瓜子',
    price: 3,
    count: 0
  })

  build() {
    Column() {
      Text(JSON.stringify(this.good))
      Button('父组件修改')
        .onClick(() => {
          // 数据会发生变化
          this.good.name = '花生'
        })
      ObjectLinkItem({
        good: this.good
      })

    }
    .width('100%')
    .padding(20)
  }
}

@Component
struct ObjectLinkItem {
  @State
  good: LinkGoodItem = new LinkGoodItemModel({} as LinkGoodItem)

  build() {
    Row({space: 20}) {
      Text(this.good.name)
      Text('¥' + this.good.price)
      Image($r('sys.media.ohos_ic_public_remove'))
        .width(20)
        .aspectRatio(1)
        .onClick(() => {
          this.good = new LinkGoodItemModel({
            name: '花生',
            price: 99,
            count: 999
          })
        })
      Text(this.good.count + '')
      Image($r('sys.media.ohos_ic_public_add'))
        .width(20)
        .aspectRatio(1)
        .onClick(() => {
          this.good.count++
        })
    }
  }
}

interface LinkGoodItem {
  name: string
  price: number
  count: number
}
export class LinkGoodItemModel implements LinkGoodItem {
  name: string = ''
  price: number = 0
  count: number = 0

  constructor(model: LinkGoodItem) {
    this.name = model.name
    this.price = model.price
    this.count = model.count
  }
}
