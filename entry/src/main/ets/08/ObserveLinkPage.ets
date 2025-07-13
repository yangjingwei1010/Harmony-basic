
@Entry
@Component
struct ObserveLinkPage {
  @State
  goodList: ObserveGoodItem[] = [
    new ObserveGoodItemModel({
    name: '瓜子',
    price: 3,
    count: 0
  }),
    new ObserveGoodItemModel({
      name: '花生',
      price: 3,
      count: 0
    }),
    new ObserveGoodItemModel({
      name: '矿泉水',
      price: 3,
      count: 0
    })]

  build() {
    Column() {
      Text(JSON.stringify(this.goodList))
      Button('父组件修改')
        .onClick(() => {
          // 数据会发生变化
          // this.good.name = '花生'
        })
      ForEach(this.goodList, (item: ObserveGoodItemModel) => {
        // 2.确保传递的对象是new过observed修饰的
        ObjectLinkItem({
          good: item
        })
      })

    }
    .width('100%')
    .padding(20)
  }
}

@Component
struct ObjectLinkItem {
  // 3.用ObjectLink修饰
  @ObjectLink
  good: ObserveGoodItemModel

  build() {
    Row({space: 20}) {
      Image($r('app.media.b'))
        .width(60)
      Text(this.good.name)
      Text('¥' + this.good.price)
      Image($r('sys.media.ohos_ic_public_remove'))
        .width(20)
        .aspectRatio(1)
        .onClick(() => {
          this.good.count--
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

export interface ObserveGoodItem {
  name: string
  price: number
  count: number
}

// 1.使用observed修饰一个类
@Observed
export class ObserveGoodItemModel implements ObserveGoodItem {
  name: string = ''
  price: number = 0
  count: number = 0

  constructor(model: ObserveGoodItem) {
    this.name = model.name
    this.price = model.price
    this.count = model.count
  }
}

