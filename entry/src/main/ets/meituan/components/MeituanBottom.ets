import { FoodItem } from '../models/Index'

@Component
struct MeituanBottom {

  @Consume('showCart')
  showCart: boolean

  @StorageLink('cart_list')
  cartList: FoodItem[] = []

  getTotalCount() {
    const result =  this.cartList.reduce((total, item) => {
      return total + (item.selectCount || 0)
    }, 0)
    return result.toString()
  }

  getTotalPrice() {
    const result =  this.cartList.reduce((total, item) => {
      return total + (item.selectCount || 0) * item.price
    }, 0)
    return result.toFixed(2)
  }

  build() {
    Row() {
      Row() {
        Badge({
          value: this.getTotalCount(),
          position: BadgePosition.Right,
          style: {
            badgeSize: 18
          }
        }) {
          Image($r('app.media.ic_public_cart'))
            .width(48)
            .height(60)
            .position({
              y: -10
            })
        }
        .margin({
          left: 20,
          right: 10
        })
        .onClick(() => {
          this.showCart = !this.showCart
        })

        // 价格
        Column() {
          Text() {
            Span('¥')
              .fontSize(12)
            Span(this.getTotalPrice())
              .fontSize(24)
          }
            .fontColor($r('app.color.white'))
          Text('预计另计配送费 ¥4')
            .fontColor($r('app.color.search_font_color'))
            .fontSize(14)
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
        // 结算
        Text('去结算')
          .height(50)
          .width(100)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .backgroundColor($r('app.color.main_color'))
          .textAlign(TextAlign.Center)
          .borderRadius({
            topRight: 25,
            bottomRight: 25
          })
      }
      .width('100%')
      .backgroundColor($r('app.color.bottom_back'))
      .height(50)
      .borderRadius(25)
      // 图片超出部分裁剪
      // .clip(true)
    }
    .width('100%')
    .padding(20)

  }
}

export default MeituanBottom