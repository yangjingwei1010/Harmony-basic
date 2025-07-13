import { FoodItem } from '../models/Index'
import MeituanCartItem from './MeituanCarItem'
import { JSON } from '@kit.ArkTS'
import { CartStore } from '../utils/CartStore'

@Component
struct MeituanCart {

  @Consume('showCart')
  showCart: boolean

  @StorageLink('cart_list')
  cart_list: FoodItem[] = []

  build() {
    Column() {
      Blank()
        .backgroundColor('rgba(0,0,0,0.7)')
        .onClick(() => {
          this.showCart = false
        })
      Column() {
        Row() {
          Text('购物车')
            .fontSize(12)
            .fontWeight(600)
          Text('清空购物车')
            .fontSize(12)
            .fontColor($r('app.color.search_back_color'))
            .onClick(() => {
              CartStore.clearCart()
              this.showCart = false
            })
        }
        .width('100%')
        .height(40)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          left: 15,
          right: 15
        })

        Divider()
          .strokeWidth(1)

        List({space: 20}) {
          ForEach(this.cart_list, (item: FoodItem) => {
            MeituanCartItem({
              item: item
            })
          },
            // 下面是解决购物车加或者减的时候图片闪的问题
            // 只会渲染一个，因为所有的id都一样
            // (food: FoodItem) => '1')
            // 会出现点前面的删除，索引没变的不更新，但是数据会匹配不上
            // (food: FoodItem, index: number) => index.toString())
            // 鸿蒙内置做法：
            // (food: FoodItem, index: number) => JSON.stringify(food) + index)
            // 唯一的id作为key，删除的时候只要id不变，UI就不会更新
            (food: FoodItem) => food.id.toString())
        }
        .divider({
          strokeWidth: 0.5,
          color: $r('app.color.left_back_color')
        })
        .padding({
          top: 10,
          left: 20,
          right: 20,
          bottom: 100
        })
      }
      .width('100%')
      .backgroundColor($r('app.color.white'))
      .borderRadius({
        topLeft: 16,
        topRight: 10
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.End)
    // .backgroundColor('rgba(0,0,0,0.7)')
  }
}

export default MeituanCart