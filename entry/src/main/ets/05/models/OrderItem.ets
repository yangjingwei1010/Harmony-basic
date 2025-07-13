export interface OrderRecord {
  orderName: string
  orderNumber: number
  orderDate: Date
}

export class OrderRecordModel implements OrderRecord {
  orderName: string = ''
  orderNumber: number = 0
  orderDate: Date = new Date()

  constructor(model: OrderRecord) {
    this.orderName = model.orderName
    this.orderNumber = model.orderNumber
    this.orderDate = model.orderDate
  }
}
