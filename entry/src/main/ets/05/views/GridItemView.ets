import GoodItem from '../models/GoodItem'

@Component
struct GridItemView {
  @State item: GoodItem = {
    goods_name: '',
    goods_price: 0,
    goods_img: '',
    goods_count: 0,
    id: 0
  }

  build() {
    GridItem() {
      Column() {
        Image(this.item.goods_img)
          .height(200)
        Row({space: 2}) {
          Text('¥' + this.item.goods_price)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Red)
          Text(this.item.goods_name)
            .maxLines(1)
            .layoutWeight(1)
            .fontWeight(FontWeight.Bold)
        }
      }
    }
  }
}

export default GridItemView