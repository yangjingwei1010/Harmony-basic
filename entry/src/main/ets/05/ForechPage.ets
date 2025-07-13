import { OrderRecordModel } from './models/OrderItem';
import OrderItemView from './views/OrderItemView';

// 转成model渲染ui
@Entry
@Component
struct ForechPage {
  @State message: string = 'Hello World';
  orderList: OrderRecordModel[] = [
    new OrderRecordModel({
    orderName: '买口红',
    orderNumber: 399,
    orderDate: new Date('2024/8/30')
  }),
    new OrderRecordModel({
      orderName: '买口红1',
      orderNumber: 299,
      orderDate: new Date('2024/9/30')
    }),
    new OrderRecordModel({
      orderName: '买口红2',
      orderNumber: 199,
      orderDate: new Date('2024/8/31')
    })]

  build() {
    Row() {
      Column() {
        Row() {
          Text('支付记录')
        }
        .padding(20)
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .border({
          width: {
            bottom: 1
          },
          color: '#ccc'
        })

        ForEach(this.orderList, (item: OrderRecordModel) => {
          OrderItemView({
            item: item
          })
        })
      }
      .width('100%')
    }
    .alignItems(VerticalAlign.Top)
    .height('100%')
  }
}