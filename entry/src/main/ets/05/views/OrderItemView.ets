import { OrderRecord, OrderRecordModel } from '../models/OrderItem'

@Component
struct OrderItemView {
  @State item: OrderRecordModel = new OrderRecordModel({} as OrderRecord)

  build() {
    Column() {
      Column({space: 16}) {
        Text(this.item.orderName)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        Row() {
          Text('¥' + this.item.orderNumber.toFixed(2))
            .fontColor(Color.Red)
          Text(this.item.orderDate.toLocaleDateString())
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .alignItems(HorizontalAlign.Start)
    }
    .padding(20)
    .width('100%')
  }
}

export default OrderItemView