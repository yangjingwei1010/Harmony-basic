import { Category, FoodItem } from '../models/Index'
import MeituanFoodItem from './MeituanFoodItem'

@Component
struct MeituanMain {
  @Prop
  list: Category[] = []
  @State
  activeIndex: number = 0

  build() {
    Row() {
      Scroll() {
        Column() {
          ForEach(this.list, (item: Category, index: number) => {
            Text(item.name)
              .height(50)
              .width('100%')
              .textAlign(TextAlign.Center)
              .fontSize(14)
              .backgroundColor(this.activeIndex === index ? $r('app.color.white') : $r('app.color.left_back_color'))
              .onClick(() => {
                this.activeIndex = index
              })
          })
        }
        .width(90)
        .height('100%')
        .backgroundColor($r('app.color.left_back_color'))
      }
      List() {
        if (this.list.length > 0) {
          ForEach(this.list[this.activeIndex].foods, (item: FoodItem) => {
            ListItem() {
              MeituanFoodItem({
                item: item
              })
            }
          })
        } else {
          ListItem() {
            Text('暂无商品上架')
          }
        }
      }
      .layoutWeight(1)
      .padding({
        bottom: 60
      })
    }
    .height('100%')
    .alignItems(VerticalAlign.Top)
  }
}

export default MeituanMain