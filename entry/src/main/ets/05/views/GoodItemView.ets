import GoodItem from '../models/GoodItem'

@Component
struct GoodItemView {

  @State item: GoodItem = {
    goods_name: '',
    goods_price: 0,
    goods_img: '',
    goods_count: 0,
    id: 0
  }

  build() {
    ListItem() {
      Row({space: 10}) {
        Image(this.item.goods_img)
          .borderRadius(8)
          .width(120)
          .height(200)
        Column() {
          Text(this.item.goods_name)
            .fontWeight(FontWeight.Bold)
          Text('¥' + this.item.goods_price.toString())
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bold)
        }
        .padding({
          top: 5,
          bottom: 5
        })
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.SpaceBetween)
        .height(200)
        .layoutWeight(1)
      }
      .width('100%')
    }
  }
}

export default GoodItemView